import 'package:flutter/material.dart';
import 'package:modernlogintute/widgets/consulatation.dart';
import 'package:modernlogintute/widgets/title_bar.dart';

class HomeKaryawan extends StatefulWidget {
  const HomeKaryawan({super.key});

  @override
  State<HomeKaryawan> createState() => _HomeKaryawanState();
}

class _HomeKaryawanState extends State<HomeKaryawan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome To Wakanda",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "GILANG ROMADHAN",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TitleBar(title: "Informasi Data Cuti"),
              Row(
                children: [
                  ConsulatationCard(
                    color: Colors.blue,
                    name: "Jumlah Cuti Saat ini",
                    cuti: "12",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
