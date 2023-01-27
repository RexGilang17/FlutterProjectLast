import 'dart:html';

import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  final screens = [
    HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: currentPage == 0
                  ? Icon(
                      Icons.home,
                      color: Colors.black45,
                    )
                  : Icon(
                      Icons.home_outlined,
                      color: Colors.grey,
                    ),
              label: "HomePage"),
          BottomNavigationBarItem(
              icon: currentPage == 1
                  ? Icon(
                      Icons.calendar_month,
                      color: Colors.black45,
                    )
                  : Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.grey,
                    ),
              label: "Calender"),
          BottomNavigationBarItem(
              icon: currentPage == 2
                  ? Icon(
                      Icons.info_rounded,
                      color: Colors.black45,
                    )
                  : Icon(
                      Icons.info_outline,
                      color: Colors.grey,
                    ),
              label: "Informasi"),
        ],
      ),
    );
  }
}
