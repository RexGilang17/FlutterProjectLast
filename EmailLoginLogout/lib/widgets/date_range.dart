import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class DateRange extends StatefulWidget {
  const DateRange({super.key});

  @override
  State<DateRange> createState() => _DateRangeState();
}

class _DateRangeState extends State<DateRange> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(2023, 12, 5),
    end: DateTime(2023, 12, 17),
  );

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                Expanded(
                  child: ElevatedButton(
                    child: Text(DateFormat('yyy/MM/dd').format(end)),
                    onPressed: pickDateRange,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Tanggal Cuti Yang Dipilih: ${difference.inDays} days',
              style: TextStyle(fontSize: 32),
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
