import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/login/login_page.dart';
// import 'package:modernlogintute/pages/hrd/.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home'),
      //   automaticallyImplyLeading: false,
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //       gradient: LinearGradient(
      //           colors: [Colors.black87, Colors.deepPurple],
      //           begin: FractionalOffset.topLeft,
      //           end: FractionalOffset.bottomRight),
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         logout(context);
      //       },
      //       icon: Icon(
      //         Icons.logout,
      //       ),
      //     )
      //   ],
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  'Selamat Datang',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  'HRD',
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 25,
                ),
                ClipOval(
                  child: Container(
                      color: Colors.grey,
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.person,
                        size: 80,
                      )),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'HRD Lion Air Group',
                  style: TextStyle(
                      // color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  'hrd40041@gmail.com',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepPurple, width: 3),
                        borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications,
                          color: Colors.deepPurple,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Pengajuan Cuti : ',
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [
                              Colors.black87,
                              Colors.deepPurple,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => ListCuti()));
                        },
                        child: Center(
                          child: Text(
                            'Lihat Pengajuan Cuti',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
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
