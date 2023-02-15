// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String? name;
  final String? categoryName;
  final String? color;
  final String? createdAt;
  final String? updatedAt;

  const CategoryEntity({
    required this.name,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryName,
  });

  @override
  String toString() =>
      '''CategoryEntity(name: $name, color: $color, createdAt: $createdAt, updatedAt: $updatedAt, categoryName: $categoryName )''';

  @override
  List<Object?> get props => [
        name,
        color,
        createdAt,
        updatedAt,
        categoryName,
      ];
}
