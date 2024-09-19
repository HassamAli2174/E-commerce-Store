import 'package:ecommerce_app/Screens/Pages/home_page.dart';
import 'package:ecommerce_app/Screens/Pages/shopping_cart.dart';
import 'package:ecommerce_app/Screens/Pages/users_list.dart';
import 'package:ecommerce_app/Services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController = PageController(initialPage: 0);
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
          _pageController.jumpToPage(index);
        },
      ),
      body: PageView(
        controller: _pageController,
        children: [
          HomePage(
            products: _products,
          ),
          ShoppingCart(products: _products),
          const UsersList()
        ],
      ),
    );
  }
}
