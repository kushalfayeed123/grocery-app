import 'package:flutter/material.dart';
import 'package:grocery_app/domain/session/grocery_item.dart';

class GroceryCard extends StatelessWidget {
  final GroceryItem grocery;
  const GroceryCard({super.key, required this.grocery});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            border: Border.all(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 100,
              child: Image.network(grocery.image),
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    grocery.name.getOrCrash().toUpperCase(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    grocery.description.getOrCrash(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Theme.of(context).colorScheme.surface),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'N${grocery.budgetedPrice.getOrCrash()}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(
                  height: 30,
                  width: 30,
                  margin: const EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      '${grocery.quantity.getOrCrash()}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
