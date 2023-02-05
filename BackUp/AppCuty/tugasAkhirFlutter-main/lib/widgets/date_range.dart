import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:tugas_akhir_flutter/pages/karyawan/calendar_page.dart';
import 'package:tugas_akhir_flutter/pages/karyawan/info_cuti.dart';

class DateRange extends StatefulWidget {
  const DateRange({super.key});

  @override
  State<DateRange> createState() => _DateRangeState();
}

const List<String> list = <String>['Melahirkan', 'Tahunan'];

class _DateRangeState extends State<DateRange> {
  String dropdownvalue = list.first;
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime(2023, 02, 17),
  );

  List dropDownListData = [
    {"title": "Cuti Tahunan", "value": "1"},
    {"title": "Cuti Melahirkan", "value": "2"},
  ];

  String defaultValue = "";
  String secondDropDown = "";

  @override
  Widget build(BuildContext context) {
    DateTime tanggalawal = dateRange.start;
    DateTime tanggalakhir = dateRange.end;
    final startDate = dateRange.start;
    final endDate = dateRange.end;
    final difference = dateRange.duration;
    TextEditingController dateform =
        TextEditingController(text: DateFormat('MM-dd-yyyy').format(startDate));
    TextEditingController dateto =
        TextEditingController(text: DateFormat('MM-dd-yyyy').format(endDate));

    User? user = FirebaseAuth.instance.currentUser;

    // final DateTime tanggalAwal;
    // DateTime tanggal = dateRange.start;

    // final DateTime updatedDate;
    // final DateRange tanggalAkhir = DateRange();
    final TextEditingController keterangan = TextEditingController();
    // final TextEditingController jenisCuti = TextEditingController();

    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // CollectionReference addData = firestore.collection('addData');
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Pilih Tanggal Cuti',
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: Text(DateFormat('yyy/MM/dd').format(startDate)),
                    onPressed: pickDateRange,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    child: Text(DateFormat('yyy/MM/dd').format(startDate)),
                    onPressed: pickDateRange,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Tanggal Cuti Yang Dipilih: ${difference.inDays} hari',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Jumlah Cuti 12 hari',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: dateform,
              decoration: InputDecoration(
                enabled: false,
                border: OutlineInputBorder(),
                hintText: DateFormat('yyy/MM/dd').format(startDate),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: dateto,
              decoration: InputDecoration(
                enabled: false,
                border: OutlineInputBorder(),
                hintText: DateFormat('yyy/MM/dd').format(endDate),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // InputDecorator(
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(15.0)),
            //     contentPadding: const EdgeInsets.all(10),
            //   ),
            //   child: DropdownButtonHideUnderline(
            //     child: DropdownButton<String>(
            //         isDense: true,
            //         value: defaultValue,
            //         isExpanded: true,
            //         menuMaxHeight: 350,
            //         items: [
            //           const DropdownMenuItem(
            //               child: Text(
            //                 "Select Course",
            //               ),
            //               value: ""),
            //           ...dropDownListData.map<DropdownMenuItem<String>>((data) {
            //             return DropdownMenuItem(
            //                 child: Text(data['title']), value: data['value']);
            //           }).toList(),
            //         ],
            //         onChanged: (value) {
            //           print("selected Value $value");
            //           setState(() {
            //             defaultValue = value!;
            //           });
            //         }),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                contentPadding: const EdgeInsets.all(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    isDense: true,
                    value: secondDropDown,
                    isExpanded: true,
                    menuMaxHeight: 350,
                    items: [
                      const DropdownMenuItem(
                          child: Text(
                            "Status Cuti",
                          ),
                          value: ""),
                      ...dropDownListData.map<DropdownMenuItem<String>>((data) {
                        return DropdownMenuItem(
                            child: Text(data['title']), value: data['value']);
                      }).toList(),
                    ],
                    onChanged: (value) {
                      print("selected Value $value");
                      setState(() {
                        secondDropDown = value!;
                      });
                    }),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: keterangan,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Keterangan',
              ),
              maxLines: 3,
            ),
            SizedBox(
              height: 25,
            ),

            ElevatedButton(
                onPressed: () async {
                  // if (secondDropDown == "") {
                  //   print("Status Cuti Yang Dipilih");
                  // } else {
                  //   print("user selected Cuti $defaultValue");
                  // }
                  CollectionReference addData =
                      FirebaseFirestore.instance.collection('users');
                  await addData.doc(user!.uid).update({
                    // // "tanggalMulai": int.tryParse(tanggalMulai.text) ?? 0,
                    // // "tanggalAkhir": DateRange.
                    // "createDate": createdDate,
                    "tanggalawal": tanggalawal,
                    "tanggalakhir": tanggalakhir,
                    "keterangan": keterangan.text,
                  });
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return InfoCuti();
                    },
                  ));
                },
                child: const Text("Submit")),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (newDateRange == null) return;
    setState(
      () => dateRange = newDateRange,
    );
  }
}
