import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class DateRange extends StatefulWidget {
  const DateRange({super.key});

  @override
  State<DateRange> createState() => _DateRangeState();
}

const List<String> list = <String>['Melahirkan', 'Tahunan'];

class _DateRangeState extends State<DateRange> {
  String dropdownvalue = list.first;
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(2023, 12, 5),
    end: DateTime(2023, 12, 17),
  );

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;
    final TextEditingController tanggalMulai = TextEditingController();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference addData = firestore.collection('addData');
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
                    child: Text(DateFormat('yyy/MM/dd').format(start)),
                    onPressed: pickDateRange,
                  ),
                ),
                const SizedBox(width: 12),
                // Expanded(
                //   child: ElevatedButton(
                //     child: Text(DateFormat('yyy/MM/dd').format(end)),
                //     onPressed: pickDateRange,
                //   ),
                // ),
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
              controller: tanggalMulai,
              decoration: InputDecoration(
                enabled: false,
                border: OutlineInputBorder(),
                hintText: DateFormat('yyy/MM/dd').format(start),
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // TextFormField(
            //   decoration: InputDecoration(
            //     enabled: false,
            //     border: OutlineInputBorder(),
            //     hintText: DateFormat('yyy/MM/dd').format(end),
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            LayoutBuilder(builder: (context, constraint) {
              List<String> itemStringList = ["Tahunan", "Melahirkan"];
              return FormField(
                initialValue: false,
                enabled: true,
                builder: (FormFieldState<bool> field) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      labelText: "Pilih Jenis Cuti",
                      errorText: field.errorText,
                      helperText: "Pilih Jenis Cuti",
                    ),
                    child: ButtonTheme(
                      alignedDropdown: false,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: "Tahunan",
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.arrow_drop_down_outlined,
                            size: 24.0,
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                          ),
                        ),
                        iconSize: 16,
                        elevation: 16,
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyMedium!.fontSize,
                          fontFamily: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .fontFamily,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                        underline: Container(
                          height: 0,
                          color: Colors.grey[300],
                        ),
                        onChanged: (String? newValue) {},
                        items: itemStringList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 0.0,
                                vertical: 0.0,
                              ),
                              child: Text(
                                value,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              );
            }),
            TextFormField(
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              onPressed: () {
                addData.add({
                  "tanggalMulai": int.tryParse(tanggalMulai.text) ?? 0,
                });
              },
              child: const Text(
                "Ajukan Cuti",
                style: TextStyle(fontSize: 15),
              ),
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
