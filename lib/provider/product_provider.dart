import 'package:flutter/foundation.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: "p1",
      productName: "Buku1",
      price: 10000,
      imageUrl: "assets/images/buku1.png",
    ),
    Product(
      id: "p2",
      productName: "Buku1",
      price: 10000,
      imageUrl: "assets/images/buku1.png",
    ),
    Product(
      id: "p3",
      productName: "Buku1",
      price: 10000,
      imageUrl: "assets/images/buku1.png",
    ),
    Product(
      id: "p4",
      productName: "Buku1",
      price: 10000,
      imageUrl: "assets/images/buku1.png",
    ),
    Product(
      id: "p5",
      productName: "Buku1",
      price: 10000,
      imageUrl: "assets/images/buku1.png",
    ),
    Product(
      id: "p6",
      productName: "Buku1",
      price: 10000,
      imageUrl: "assets/images/buku1.png",
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) {
      return prod.id == id;
    });
  }

  void add(Product newProduct) {
    _items.insert(0, newProduct);
    notifyListeners();
  }
}
