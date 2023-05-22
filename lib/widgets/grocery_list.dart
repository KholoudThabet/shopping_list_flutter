import 'package:flutter/material.dart';

import 'package:shoppinglist/models/grocery_items.dart';
import 'package:shoppinglist/widgets/new_item.dart';

// ignore: camel_case_types
class grocery_list extends StatefulWidget {
  const grocery_list({Key? key}) : super(key: key);

  @override
  State<grocery_list> createState() => _grocery_listState();
}

// ignore: camel_case_types
class _grocery_listState extends State<grocery_list> {
  final List<GroceryItem> grocery_item = [];

  void _addNewItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (context) => const NewItem(),
      ),
    );
    if (newItem != null) {
      setState(() {
        grocery_item.add(newItem);
      });
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No items'),
    );
    if (grocery_item.isNotEmpty) {
      content = ListView.builder(
        itemCount: grocery_item.length,
        itemBuilder: (context, index) => Dismissible(
          key: Key(grocery_item[index].id),
          onDismissed: (direction) {
            setState(() {
              grocery_item.removeAt(index);
            });
          },
          child: ListTile(
            title: Text(grocery_item[index].name),
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: grocery_item[index].category.color,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            trailing: Text(grocery_item[index].quantity.toString()),
          ),
        ),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Grocery List'),
          actions: [
            IconButton(
              onPressed: () => _addNewItem(),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: content);
  }
}
