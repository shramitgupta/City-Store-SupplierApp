import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:ms_supplier_app/main_screens/cart.dart';
import 'package:ms_supplier_app/main_screens/category.dart';
import 'package:ms_supplier_app/main_screens/home.dart';
import 'package:ms_supplier_app/main_screens/profile.dart';
import 'package:ms_supplier_app/main_screens/stores.dart';
import 'package:ms_supplier_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomerHomeScreen> createState() => CustomerHomeScreenState();
}

class CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> tabs = [
    const HomeScreen(),
    const CategoryScreen(),
    const StoresScreen(),
    const CartScreen(),
    const ProfileScreen(
        /* documentId: FirebaseAuth.instance.currentUser!.uid, */
        ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Category',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Stores',
          ),
          BottomNavigationBarItem(
            icon: Badge(
                showBadge: context.read<Cart>().getItems.isEmpty ? false : true,
                // padding: const EdgeInsets.all(2),
                // badgeColor: Colors.yellow,
                badgeContent: Text(
                  context.watch<Cart>().getItems.length.toString(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                child: const Icon(Icons.shopping_cart)),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}