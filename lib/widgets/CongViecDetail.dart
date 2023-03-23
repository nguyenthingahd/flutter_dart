import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/congviec.dart';

class CongViecDetailScreen extends StatelessWidget {
  final CongViec congviec;

  CongViecDetailScreen(this.congviec);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(congviec.nameCongViec),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tên công việc: ${congviec.nameCongViec}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Deadline: ${DateFormat('dd-MM-yyyy HH:mm:ss').format(congviec.deadline)}',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}