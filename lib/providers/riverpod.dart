import '../models/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<Categories> categoryProvider = StateProvider(
  (ref) => const Categories(
    category: "drink",
    title: "飲み物",
    color: Colors.white,
    iconData: Icons.local_drink,
  ),
);
