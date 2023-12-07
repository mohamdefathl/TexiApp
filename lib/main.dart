import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiapp/constant/binding.dart';
import 'package:taxiapp/constant/theme.dart';
import 'package:taxiapp/view/pages/detail/detailpage.dart';
import 'package:taxiapp/view/pages/history/historypage.dart';
import 'package:taxiapp/view/pages/home/orders.dart';

import 'package:taxiapp/view/pages/login/login.dart';
import 'package:taxiapp/view/pages/map/custommap.dart';
import 'package:taxiapp/view/widget/general/BottomBar.dart';
import 'package:taxiapp/view/widget/home/order.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MyBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Taxi',
      themeMode: ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
      // home: Get.dialog(),
      initialRoute:"/home",
      getPages: [
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/home', page: () => Home()),
        GetPage(name: '/historyPage', page: () => HistoryPage()),
        GetPage(name: '/map', page: () => CustomMap()),
        // GetPage(name: '/detailPage', page: () => DetailPsage()),
      ],
      // home:Home(),
      // home: ,
    );
  }
}
