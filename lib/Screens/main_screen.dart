import 'package:ecommerce_app/screens/pages/home_page.dart';
import 'package:ecommerce_app/screens/pages/shopping_cart.dart';
import 'package:ecommerce_app/screens/pages/users_list.dart';
import 'package:ecommerce_app/services/services.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;
  List<dynamic> _products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
    _pageController.addListener(() {
      if (_pageController.page!.round() != _selectedIndex) {
        setState(() {
          _selectedIndex = _pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  fetchProducts() async {
    EcommerceServices services = EcommerceServices();
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Users List'),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment_rounded), label: 'Payment'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
      body: PageView(
        controller: _pageController,
        children: [
          HomePage(
            products: _products,
          ),
          ShoppingCart(
            products: _products,
          ),
          const UsersList()
        ],
      ),
    );
  }
}
