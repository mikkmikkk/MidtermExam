import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ProductsPage(),
  ));
}

class Product {
  final int id;
  final String name;
  final double price;
  final int stock;

  Product({required this.id, required this.name, required this.price, required this.stock});
}

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final List<Product> products = [
    Product(id: 1, name: 'Product A', price: 19.99, stock: 100),
    Product(id: 2, name: 'Product B', price: 29.99, stock: 50),
    Product(id: 3, name: 'Product C', price: 39.99, stock: 75),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Search products...',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  DataTable(
                    columns: const <DataColumn>[
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Price')),
                      DataColumn(label: Text('Stock')),
                    ],
                    rows: products.map((product) {
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(Text(product.id.toString())),
                          DataCell(Text(product.name)),
                          DataCell(Text('\$${product.price.toStringAsFixed(2)}')),
                          DataCell(Text(product.stock.toString())),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                _showAddProductDialog(context); // Show the popup
              },
              icon: Icon(Icons.add),
              label: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show the dialog to add a product
  void _showAddProductDialog(BuildContext context) {
    final _nameController = TextEditingController();
    final _priceController = TextEditingController();
    final _stockController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
        title: Text('Add New Product'),
          content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
              TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number, 
              ),
              SizedBox(height: 10),
              TextField(
                controller: _stockController,
                decoration: InputDecoration(labelText: 'Stock'),
                keyboardType: TextInputType.number, 
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); 
              },
            ),
            ElevatedButton(
              child: Text('Add Product'),
              onPressed: () {
            
                Navigator.of(context).pop(); 
              },
            ),
          ],
        );
      },
    );
  }
}
