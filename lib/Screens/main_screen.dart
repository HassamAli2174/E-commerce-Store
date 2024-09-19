import 'package:ecommerce_app/Screens/Pages/home_page.dart';
import 'package:ecommerce_app/Services/services.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTab = 0;
  List<dynamic> _products = [];
  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  fetchProducts() async {
    EcommerceService services = EcommerceService();
    _products = await services.fetchProducts();
    setState(() {
      _products;
    });
    print(_products.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        selectedItemColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User List'),
        ],
        onTap: (index) {
          _selectedTab = index;
        },
      ),
      body: PageView(
        children: [
          HomePage(
            products: _products,
          ),
          const Text('Page2'),
          const Text('Page3')
        ],
      ),
    );
  }
}
