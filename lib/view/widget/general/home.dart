import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/functions/alertexitapp.dart';
import 'package:taxiapp/view/pages/history/historypage.dart';
import 'package:taxiapp/view/pages/onGoing/onGoaing.dart';
import 'package:taxiapp/view/pages/setting.dart';
import 'package:taxiapp/view/pages/orders/orders.dart';
import 'package:taxiapp/controllers/home_controlle.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // final int index;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const Setting(),
      const HistoryPage(),
      OnGoing(),
      Orders(),
    ];

    return WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<HomeController>(
          init: HomeController(),
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
                child: pages[_.selectedIndex],
              ),
            );
          },
        ));
  }
}
