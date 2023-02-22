import 'package:articulation_support/providers/riverpod.dart';
import 'package:articulation_support/screens/category_item.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/categories.dart';

class Home extends ConsumerWidget {
  static const routeName = '/home';
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceHeight =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: GridView(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: categoryData
              .map(
                (categoryData) => CategoryItem(
                  category: categoryData.category,
                  title: categoryData.title,
                  color: categoryData.color,
                  iconData: categoryData.iconData,
                ),
              )
              .toList(),
        ),
      ),
      // backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
// Name
// Text(FirebaseAuth.instance.currentUser!.displayName!),
