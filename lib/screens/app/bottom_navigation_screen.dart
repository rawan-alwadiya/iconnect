import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconnect/models/bn_screen.dart';
import 'package:iconnect/screens/app/cart_screen.dart';
import 'package:iconnect/screens/app/favorites_screen.dart';
import 'package:iconnect/screens/app/home_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  int _currentIndex= 0;

  final List<BnScreen> _screens = <BnScreen>[
    const BnScreen(widget: HomeScreen(), title: 'Home'),
    const BnScreen(widget: CartScreen(), title: 'Cart'),
    const BnScreen(widget: FavoritesScreen(), title: 'Favorites')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex].widget,
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xFF40A798),
        backgroundColor: Colors.transparent,
        height: 70,
        onTap: (int currentIndex){
          setState(() => _currentIndex = currentIndex);
      },
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
          CupertinoIcons.cart_fill,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

