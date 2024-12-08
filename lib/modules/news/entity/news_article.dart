import 'package:equatable/equatable.dart';

class NewsArticle extends Equatable {
  final String title;
  final String description;
  final String? imageUrl;

  const NewsArticle({
    required this.title,
    required this.description,
    this.imageUrl,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      imageUrl: json['image_url'],
    );
  }

  @override
  List<Object?> get props => [title, description, imageUrl];
}