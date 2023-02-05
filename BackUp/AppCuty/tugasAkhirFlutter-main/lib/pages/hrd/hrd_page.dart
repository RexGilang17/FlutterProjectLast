import 'package:flutter/material.dart';
import 'package:tugas_akhir_flutter/pages/hrd/data_cuti_page.dart';
import 'package:tugas_akhir_flutter/pages/hrd/home_page.dart';

class HrdPage extends StatefulWidget {
  const HrdPage({super.key});

  @override
  State<HrdPage> createState() => _HrdPageState();
}

class _HrdPageState extends State<HrdPage> {
  PageController pageController = new PageController();
  int currentIndex = 0;

  void onTap(int page) {
    setState(() {
      currentIndex - page;
    });
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        controller: pageController,
        children: [
          HomePage(),
          DataCutiPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        backgroundColor: Colors.grey.shade900,
        selectedIconTheme: IconThemeData(color: Colors.purpleAccent),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        unselectedLabelStyle: TextStyle(
          color: Colors.white,
        ),
        unselectedItemColor: Colors.white,
        iconSize: 26.0,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Data Cuti',
          ),
        ],
        selectedItemColor: Colors.purpleAccent,
      ),
    );
  }
}
