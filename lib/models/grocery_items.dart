import 'package:shoppinglist/models/category.dart';

class GroceryItem {
  String name;
  int quantity;
  Category category;
  String id;

  GroceryItem(
      {required this.name,
      required this.quantity,
      required this.category,
      required this.id});
}
