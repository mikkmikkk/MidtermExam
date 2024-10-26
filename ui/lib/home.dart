import 'package:flutter/material.dart';
import 'ProductsPage.dart';
import 'SuppliersPage.dart';
import 'SupplyOrdersPage.dart';


void main() {
  runApp(MaterialApp(
      theme: ThemeData(
      scaffoldBackgroundColor: Colors.white, 
      appBarTheme: AppBarTheme( color: const Color.fromARGB(255, 255, 255, 255), 
),
      colorScheme: ColorScheme.light().copyWith(
        primary: const Color.fromARGB(255, 32, 38, 43),     
        onPrimary: Colors.white,    
        error: Colors.red, 
      ),
    ),
     home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory Dashboard'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Products'),
            Tab(text: 'Suppliers'),
            Tab(text: 'Supply Orders'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ProductsPage(),
          SuppliersPage(),
          SupplyOrdersPage(),
        ],
      ),
    );
  }
}

