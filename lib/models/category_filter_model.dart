import 'package:equatable/equatable.dart';

import 'models.dart';

class CategoryFilterModel extends Equatable {
  final int id;
  final Category category;
  final bool value;

  const CategoryFilterModel(
      {required this.category, required this.value, required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id, category, value];

  CategoryFilterModel copyWith({int? id, Category? category, bool? value}) {
    return CategoryFilterModel(
        category: category ?? this.category,
        value: value ?? this.value,
        id: id ?? this.id);
  }

  static List<CategoryFilterModel> categoryFilters = Category.categories
      .map((e) =>
          CategoryFilterModel(category: e, value: false, id: e.id))
      .toList();
}
