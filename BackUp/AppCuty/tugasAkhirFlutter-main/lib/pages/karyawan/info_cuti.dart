import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoCuti extends StatefulWidget {
  const InfoCuti({super.key});

  @override
  State<InfoCuti> createState() => _InfoCutiState();
}

class _InfoCutiState extends State<InfoCuti> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Cuti'),
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueGrey, Colors.grey],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: users.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                  children: snapshot.data!.docs.map((document) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blueGrey,
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 6,
                    // leading: CircleAvatar(child: Text(document['name'][0])),
                    // title: Text('Name: ' + document['name']),
                    // subtitle: Text('Email: ' + document['email']),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Name: ' + document['name'],
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Text('Email: ' + document['email'],
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        // Text('Awal Cuti: ' + document['tanggalawal'].toString(),
                        //     style:
                        //         TextStyle(color: Colors.white, fontSize: 15)),
                        // Text(
                        //     'Akhir Cuti: ' +
                        //         document['tanggalakhir'].toString(),
                        //     style:
                        //         TextStyle(color: Colors.white, fontSize: 15)),
                        Text('Keterangan: ' + document['keterangan'],
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                      ],
                    ),
                    // trailing: ,
                  ),
                );
              }).toList());
            } else {
              return Text('Loading..');
            }
          }),
    );
  }
}
