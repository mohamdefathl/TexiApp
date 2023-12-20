import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/controllers/taxi_controllers/taxihome_controller.dart';
import 'package:taxiapp/functions/alertexitapp.dart';
import 'package:taxiapp/controllers/home_controlle.dart';
import 'package:taxiapp/view/pages/setting.dart';
import 'package:taxiapp/view/pages/taxiOrders/taxiOrders.dart';

class TaxiHome extends StatelessWidget {
  const TaxiHome({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const Setting(),
      TaxiOrders(),
      
      TaxiOrders(),
    ];
    return WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<TaxiHomeController>(
          init: TaxiHomeController(),
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
                child: pages[_.selectedIndex],
              ),
            );
          },
        ));
  }
}
