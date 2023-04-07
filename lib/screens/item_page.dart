import 'package:flutter/material.dart';
import 'package:shop/models/catalog.dart';

import 'list_of_products.dart';

class ProductScreen extends StatelessWidget {
  final Item product;

  ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Описание товара"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: product.color,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  '${product.price} руб.',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    AddButton(item: product);
                  },
                  child: Text('Add to cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}