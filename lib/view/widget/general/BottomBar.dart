import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/functions/alertexitapp.dart';
import 'package:taxiapp/view/pages/history/historypage.dart';
import 'package:taxiapp/view/pages/setting.dart';
import 'package:taxiapp/view/pages/home/orders.dart';
import 'package:taxiapp/controllers/bottomnavbar_controlle.dart';
import 'package:taxiapp/view/pages/login/login.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<Widget> _pages = [
    const Setting(),
    const Setting(),
    const HistoryPage(),
     Orders(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<BottommNavBarController>(
          init: BottommNavBarController(),
          builder: (_) {
            return Scaffold(
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(right: 5, left: 5, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.all(Radius.circular(27)),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.shadow,
                          spreadRadius: 0.4,
                          blurRadius: 5,
                        )
                      ]),
                  child: ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: NavigationBar(
                        // elevation: 3,
                        indicatorColor: AppColor.secondary,
                        selectedIndex: _.selectedIndex,
                        onDestinationSelected: (val) {
                          _.onItemTapped(val);
                        },
                        shadowColor: Colors.grey,
                        height: 65,
                        labelBehavior:
                            NavigationDestinationLabelBehavior.onlyShowSelected,
                        destinations: _.bottomNavBar.map((items) {
                          return NavigationDestination(
                              icon: Icon(items['icon']), label: items['title']);
                        }).toList()),
                  ),
                ),
              ),
              body: Container(
                child: _pages[_.selectedIndex],
              ),
            );
          },
        ));
  }
}
