import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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

    return Scaffold(
      body: Container(padding: EdgeInsets.all(16), 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Date Range', style: TextStyle(fontSize: 32),)
        ],
      ),
      ),
    
    );
  }
}
