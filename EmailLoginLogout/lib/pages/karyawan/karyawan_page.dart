import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/karyawan/calender.dart';
import 'package:modernlogintute/pages/karyawan/home_page.dart';
import 'package:modernlogintute/pages/karyawan/profile.dart';
import 'package:modernlogintute/pages/login/login_page.dart';

class KaryawanPage extends StatefulWidget {
  const KaryawanPage({super.key});

  @override
  State<KaryawanPage> createState() => _KaryawanPageState();
}

class _KaryawanPageState extends State<KaryawanPage> {
  final users = FirebaseAuth.instance.currentUser!;
  int currentPage = 0;
  final screen = [
    HomeKaryawan(),
    CalenderKaryawan(),
    ProfileKaryawan(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Karyawan" + users.email!),
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: Icon(
              Icons.logout,
            ),
          ),
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
