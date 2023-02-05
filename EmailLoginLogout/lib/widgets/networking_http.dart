// import 'dart:convert';
// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:cloud_firestore/cloud_firestore.dart';

// class NetworkHttp extends StatefulWidget {
//   const NetworkHttp({super.key});

//   @override
//   State<NetworkHttp> createState() => _NetworkHttpState();
// }

// class _NetworkHttpState extends State<NetworkHttp> {
//   @override
//   Widget build(BuildContext context) {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     CollectionReference users = firestore.collection("users");

//     // ignore: no_leading_underscores_for_local_identifiers
//     final _formKey = GlobalKey<FormState>();
//     final add1 = TextEditingController();
//     final add2 = TextEditingController();
//     final add3 = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text("Get Data From Api"),
//         actions: [
//           IconButton(
//             onPressed: () {
//               showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                         scrollable: true,
//                         content: Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Form(
//                               key: _formKey,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   TextFormField(
//                                     controller: add1,
//                                     decoration: const InputDecoration(
//                                       labelText: 'Nama',
//                                       icon: Icon(Icons.person_add),
//                                     ),
//                                     // The validator receives the text that the user has entered.
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Please input your Name';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   TextFormField(
//                                     controller: add3,
//                                     decoration: const InputDecoration(
//                                       labelText: 'Gender',
//                                       icon: Icon(Icons.male),
//                                     ),
//                                     // The validator receives the text that the user has entered.
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Please input your Gender';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   TextFormField(
//                                     controller: add2,
//                                     decoration: const InputDecoration(
//                                       labelText: 'Email',
//                                       icon: Icon(Icons.email),
//                                     ),
//                                     // The validator receives the text that the user has entered.
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Please input your Email';
//                                       }
//                                       if (!EmailValidator.validate(value)) {
//                                         return 'Please enter a valid email';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             )),
//                         actions: [
//                           ElevatedButton(
//                             child: Text("Tambah"),
//                             // style: ButtonStyle(
//                             //     backgroundColor:
//                             //         MaterialStateProperty.all(Colors.purple)),
//                             onPressed: (() {
//                               if (_formKey.currentState!.validate()) {
//                                 users.add({
//                                   "nama": add1.text,
//                                   "email": add2.text,
//                                   "gender": add3.text,
//                                   "password": ""
//                                 });

//                                 add1.clear();
//                                 add2.clear();
//                                 add3.clear();
//                                 Navigator.of(context).pop();
//                                 showDialog<String>(
//                                   context: context,
//                                   builder: (BuildContext context) =>
//                                       AlertDialog(
//                                     title: const Text("Data ditambahkan"),
//                                     content: const Text("Silahkan kembali"),
//                                     actions: <Widget>[
//                                       TextButton(
//                                         onPressed: () =>
//                                             Navigator.pop(context, "ok"),
//                                         child: const Text("ok"),
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                                 // });
//                               }
//                             }),
//                           )
//                         ]);
//                   });
//             },
//             icon: const Icon(
//               Icons.add,
//             ),
//           ),
//         ],
//       ),
//       body: Container(child: UsingTheData()),
//     );
//   }
// }

// class UsingTheData extends StatefulWidget {
//   UsingTheData({super.key});

//   @override
//   State<UsingTheData> createState() => _UsingTheDataState();
// }

// class _UsingTheDataState extends State<UsingTheData> {
//   @override
//   Widget build(BuildContext context) {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     CollectionReference users = firestore.collection("users");

//     final _formKey = GlobalKey<FormState>();
//     final add1 = TextEditingController();
//     final add2 = TextEditingController();
//     final add3 = TextEditingController();

//     return StreamBuilder<QuerySnapshot>(
//       stream: users.snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Column(
//               children: snapshot.data!.docs
//                   .map((e) => ListTile(
//                         leading: CircleAvatar(child: Text(e["nama"][0])),
//                         title: Text(e["nama"]),
//                         subtitle: Text(e["email"]),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             IconButton(
//                               onPressed: () {
//                                 add1.text = e["nama"];
//                                 add2.text = e["email"];
//                                 add3.text = e["gender"];
//                                 showDialog(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       return AlertDialog(
//                                           scrollable: true,
//                                           content: Padding(
//                                               padding:
//                                                   const EdgeInsets.all(10.0),
//                                               child: Form(
//                                                 key: _formKey,
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     TextFormField(
//                                                       controller: add1,
//                                                       decoration:
//                                                           const InputDecoration(
//                                                         labelText: 'Nama',
//                                                         icon: Icon(
//                                                             Icons.person_add),
//                                                       ),
//                                                       // The validator receives the text that the user has entered.
//                                                       validator: (value) {
//                                                         if (value == null ||
//                                                             value.isEmpty) {
//                                                           return 'Please input your Name';
//                                                         }
//                                                         return null;
//                                                       },
//                                                     ),
//                                                     TextFormField(
//                                                       controller: add3,
//                                                       decoration:
//                                                           const InputDecoration(
//                                                         labelText: 'Gender',
//                                                         icon: Icon(Icons.male),
//                                                       ),
//                                                       // The validator receives the text that the user has entered.
//                                                       validator: (value) {
//                                                         if (value == null ||
//                                                             value.isEmpty) {
//                                                           return 'Please input your Gender';
//                                                         }
//                                                         return null;
//                                                       },
//                                                     ),
//                                                     TextFormField(
//                                                       controller: add2,
//                                                       decoration:
//                                                           const InputDecoration(
//                                                         labelText: 'Email',
//                                                         icon: Icon(Icons.email),
//                                                       ),
//                                                       // The validator receives the text that the user has entered.
//                                                       validator: (value) {
//                                                         if (value == null ||
//                                                             value.isEmpty) {
//                                                           return 'Please input your Email';
//                                                         }
//                                                         if (!EmailValidator
//                                                             .validate(value)) {
//                                                           return 'Please enter a valid email';
//                                                         }
//                                                         return null;
//                                                       },
//                                                     ),
//                                                   ],
//                                                 ),
//                                               )),
//                                           actions: [
//                                             ElevatedButton(
//                                               child: Text("Update"),
//                                               // style: ButtonStyle(
//                                               //     backgroundColor:
//                                               //         MaterialStateProperty.all(Colors.purple)),
//                                               onPressed: (() {
//                                                 if (_formKey.currentState!
//                                                     .validate()) {
//                                                   users.doc(e.id).update({
//                                                     "nama": add1.text,
//                                                     "email": add2.text,
//                                                     "gender": add3.text,
//                                                     "password": ""
//                                                   });

//                                                   add1.clear();
//                                                   add2.clear();
//                                                   add3.clear();
//                                                   Navigator.of(context).pop();
//                                                   showDialog<String>(
//                                                     context: context,
//                                                     builder: (BuildContext
//                                                             context) =>
//                                                         AlertDialog(
//                                                       title: const Text(
//                                                           "Data Berhasil diupdate"),
//                                                       content: const Text(
//                                                           "Silahkan kembali"),
//                                                       actions: <Widget>[
//                                                         TextButton(
//                                                           onPressed: () =>
//                                                               Navigator.pop(
//                                                                   context,
//                                                                   "ok"),
//                                                           child:
//                                                               const Text("ok"),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   );
//                                                   // });
//                                                 }
//                                               }),
//                                             )
//                                           ]);
//                                     });
//                               },
//                               icon: const Icon(
//                                 Icons.edit,
//                               ),
//                             ),
//                             IconButton(
//                               onPressed: () {
//                                 showDialog<String>(
//                                   context: context,
//                                   builder: (BuildContext context) =>
//                                       AlertDialog(
//                                     title: const Text("Menghapus data"),
//                                     content: const Text(
//                                         "Anda yakin ingin menghapus data ini!"),
//                                     actions: <Widget>[
//                                       TextButton(
//                                         onPressed: () {
//                                           Navigator.pop(context, "close");
//                                         },
//                                         child: const Text("Cancel"),
//                                       ),
//                                       TextButton(
//                                         onPressed: (() {
//                                           users.doc(e.id).delete();
//                                           Navigator.pop(context, "ok");
//                                         }),
//                                         child: const Text("ok"),
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               },
//                               icon: const Icon(
//                                 Icons.remove_circle_outline,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ))
//                   .toList());
//         } else if (snapshot.hasError) {
//           return Text('${snapshot.error}');
//         }
//         return Center(child: const CircularProgressIndicator());
//       },
//     );
//   }
// }
