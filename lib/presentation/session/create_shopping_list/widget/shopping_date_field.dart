// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

import '../../../../application/session/session_form/session_form_bloc.dart';

class ShoppingDateField extends HookWidget {
  const ShoppingDateField({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedDate = useState(DateTime.now());

    return BlocListener<SessionFormBloc, SessionFormState>(
      listenWhen: (p, c) => p.session.scheduledDate != c.session.scheduledDate,
      listener: (context, state) {
        selectedDate.value = state.session.scheduledDate;
      },
      child: GestureDetector(
        onTap: () async {
          selectedDate.value = await showDatePicker(
                  context: context,
                  initialDate: selectedDate.value,
                  currentDate: selectedDate.value,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2050)) ??
              DateTime.now();

          selectedDate.value = selectedDate.value.copyWith(
            hour: 8,
            minute: 00,
          );
          context
              .read<SessionFormBloc>()
              .add(SessionFormEvent.scheduledDateChanged(selectedDate.value));
        },
        child: Text(
          DateFormat.yMMMd().format(selectedDate.value),
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
