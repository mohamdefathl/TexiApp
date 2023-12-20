import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:taxiapp/constant/binding.dart';
import 'package:taxiapp/constant/theme.dart';
import 'package:taxiapp/view/pages/chat/chat.dart';
import 'package:taxiapp/view/pages/detail/detailpage.dart';
import 'package:taxiapp/view/pages/history/historypage.dart';
import 'package:taxiapp/view/pages/map/mappage.dart';
import 'package:taxiapp/view/pages/orders/orders.dart';

import 'package:taxiapp/view/pages/login/login.dart';
import 'package:taxiapp/view/pages/onGoing/onGoaing.dart';
import 'package:taxiapp/view/pages/setting.dart';
import 'package:taxiapp/view/pages/taxihome/taxihome.dart';
import 'package:taxiapp/view/widget/general/home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
    await initializeDateFormatting('ar');

  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

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
      // themeMode: ThemeMode.light,
      themeMode: ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
      // home: ,
      initialRoute: "/login",
      getPages: [
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/home', page: () => Home()),
        GetPage(name: '/taxihome', page: () => TaxiHome()),
        GetPage(name: '/setting', page: () => Setting()),
        GetPage(name: '/orders', page: () => Orders()),
        GetPage(name: '/history', page: () => HistoryPage()),
        // GetPage(name: '/map', page: () => CustomMap()),
        GetPage(name: '/ongoaing', page: () => OnGoing()),
        // GetPage(name: '/chat', page: () => ChatScreen()),
        // GetPage(name: '/detailPage', page: () => DetailPsage()),
      ],
      // home:Home(),
      // home: ,
    );
  }
}
