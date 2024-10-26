import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SupplyOrdersPage(),
  ));
}

class SupplyOrder {
  final int id;
  final String supplier;
  final String product;
  final int quantity;
  final String status;

  SupplyOrder({required this.id, required this.supplier, required this.product, required this.quantity, required this.status});
}

class SupplyOrdersPage extends StatefulWidget {
  @override
  _SupplyOrdersPageState createState() => _SupplyOrdersPageState();
}

class _SupplyOrdersPageState extends State<SupplyOrdersPage> {
  final List<SupplyOrder> orders = [
    SupplyOrder(id: 1, supplier: 'Supplier X', product: 'Product A', quantity: 50, status: 'Pending'),
    SupplyOrder(id: 2, supplier: 'Supplier Y', product: 'Product B', quantity: 25, status: 'Shipped'),
    SupplyOrder(id: 3, supplier: 'Supplier Z', product: 'Product C', quantity: 100, status: 'Delivered'),
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Supply Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Search orders...',
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
                      DataColumn(label: Text('Supplier')),
                      DataColumn(label: Text('Product')),
                      DataColumn(label: Text('Quantity')),
                      DataColumn(label: Text('Status')),
                    ],
                    rows: orders.map((order) {
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(Text(order.id.toString())),
                          DataCell(Text(order.supplier)),
                          DataCell(Text(order.product)),
                          DataCell(Text(order.quantity.toString())),
                          DataCell(Text(order.status)),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                _showAddSupplierOrder(context);
              },
              icon: Icon(Icons.add),
              label: Text('Add Order'),
            ),
          ],
        ),
      ),
    );
  }
}

void _showAddSupplierOrder(BuildContext context) {
  final _supplierController = TextEditingController();
  final _productController = TextEditingController();
  final _quantityController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Add New Supply Order'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _supplierController,
              decoration: InputDecoration(labelText: 'Supplier'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _productController,
              decoration: InputDecoration(labelText: 'Product'),
              keyboardType: TextInputType.text, 
            ),
            SizedBox(height: 10),
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(labelText: 'Quantity'),
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
            child: Text('Add Order'),
            onPressed: () {
              
              Navigator.of(context).pop(); 
            },
          ),
        ],
      );
    },
  );
}
