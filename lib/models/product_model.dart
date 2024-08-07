class Product {
  final String id;
  final String title;
  final double price;

  Product({
    required this.id,
    required this.title,
    required this.price,
  });
}

class CartItem {
  final String id;
  final String title;
  final String dosage;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.dosage,
    required this.quantity,
    required this.price,
  });
}
