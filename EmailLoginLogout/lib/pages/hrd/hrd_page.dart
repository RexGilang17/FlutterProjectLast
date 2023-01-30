import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/hrd/calender.dart';
import 'package:modernlogintute/pages/hrd/home_page.dart';
import 'package:modernlogintute/pages/hrd/profile.dart';
import 'package:modernlogintute/pages/login/login_page.dart';

class HrdPage extends StatefulWidget {
  const HrdPage({super.key});

  @override
  State<HrdPage> createState() => _HrdPageState();
}

class _HrdPageState extends State<HrdPage> {
  int currentPage = 0;
  final screen = [
    HomePage(),
    Calender(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("HRD"),
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: IndexedStack(index: currentPage, children: screen),
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
                      Icons.person,
                      color: Colors.black45,
                    )
                  : Icon(
                      Icons.person_outlined,
                      color: Colors.grey,
                    ),
              label: "Profile"),
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
