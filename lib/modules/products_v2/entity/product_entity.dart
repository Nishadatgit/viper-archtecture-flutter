import 'package:viper_test/modules/products/entity/product_entity.dart';

class ProductEntityV2 extends ProductEntity {
  final double price;

  const ProductEntityV2({
    required super.title,
    required super.description,
    super.imageUrl,
    required this.price,
  });

  factory ProductEntityV2.fromJson(Map<String, dynamic> json) {
    final base = ProductEntity.fromJson(json);
    return ProductEntityV2(
      title: base.title,
      description: base.description,
      imageUrl: base.imageUrl,
      price: (json['price'] ?? 0.0).toDouble(),
    );
  }

  @override
  List<Object?> get props => [...super.props, price];
}
