import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories.freezed.dart';

@freezed
abstract class Categories with _$Categories {
  const factory Categories({
    String? category,
    String? title,
    Color? color,
    IconData? iconData,
  }) = _Categories;
}
