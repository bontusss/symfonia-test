import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symfonia_test/pages/home.dart';
import 'package:symfonia_test/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  void onTap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> pages = const [
    HomePage(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Symfonia test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: primaryColor,
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          backgroundColor: primaryColor,
          elevation: 0,
          onTap: onTap,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.web_rounded), label: 'Web'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notification_add), label: 'Notify'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
        body: pages[currentIndex],
        // body: Coins(),
      ),
    );
  }
}
