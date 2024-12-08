import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String title;
  final String description;
  final String? imageUrl;

  const ProductEntity({
    required this.title,
    required this.description,
    this.imageUrl,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      imageUrl: json['image'],
    );
  }

  @override
  List<Object?> get props => [title, description, imageUrl];
}
