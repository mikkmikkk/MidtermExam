import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SuppliersPage(),
  ));
}

class Supplier {
  final int id;
  final String name;
  final String contact;
  final String email;

  Supplier({required this.id, required this.name, required this.contact, required this.email});
}

class SuppliersPage extends StatefulWidget {
  @override
  _SuppliersPageState createState() => _SuppliersPageState();
}

class _SuppliersPageState extends State<SuppliersPage> {
  final List<Supplier> suppliers = [
    Supplier(id: 1, name: 'Supplier X', contact: 'John Doe', email: 'john@supplierx.com'),
    Supplier(id: 2, name: 'Supplier Y', contact: 'Jane Smith', email: 'jane@suppliery.com'),
    Supplier(id: 3, name: 'Supplier Z', contact: 'Bob Johnson', email: 'bob@supplierz.com'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suppliers'),
      ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
            decoration: InputDecoration(
            labelText: 'Search suppliers...',
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
                      DataColumn(label: Text('Contact')),
                      DataColumn(label: Text('Email')),
                    ],
                    rows: suppliers.map((supplier) {
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(Text(supplier.id.toString())),
                          DataCell(Text(supplier.name)),
                          DataCell(Text(supplier.contact)),
                          DataCell(Text(supplier.email)),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                _showAddSuppliers(context);
              },
              icon: Icon(Icons.add),
              label: Text('Add Supplier'),
            ),
          ],
        ),
      ),
    );
  }
}

void _showAddSuppliers(BuildContext context) {
  final _nameController = TextEditingController();
  final _contactController = TextEditingController(); 
  final _emailController = TextEditingController(); 

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Add New Supplier'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _contactController,
              decoration: InputDecoration(labelText: 'Contact'),
              keyboardType: TextInputType.text, 
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress, 
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
            child: Text('Add Supplier'),
            onPressed: () {
               Navigator.of(context).pop(); 
            },
          ),
        ],
      );
    },
  );
}
