import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/view/pages/dashboard.dart';
import 'package:taxiapp/view/pages/login/login.dart';
import 'package:taxiapp/view/pages/map.dart';
import 'package:taxiapp/view/pages/home/orders.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    Dashboard(),    
    Orders(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.blackSecond,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'لوحة التحكم',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ألصفحة الرئيسية',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: Colors.white, // Set the unselected item color to white
        onTap: _onItemTapped,
      ),
      body: Container(
        child: _pages.elementAt(_selectedIndex),
      ),
    );
  }
}