import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String category;
  final String title;
  final Color color;
  final IconData iconData;
  const CategoryItem({
    super.key,
    required this.category,
    required this.title,
    required this.color,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    final deviceHeight =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    // iPhone se 2 611 pixel
    return Card(
      color: Theme.of(context).colorScheme.primary,
      margin: const EdgeInsets.all(8),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        splashColor: Theme.of(context).colorScheme.primary,
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 40,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              Icon(
                iconData,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              )
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
