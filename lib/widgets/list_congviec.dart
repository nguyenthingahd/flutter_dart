import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import '../models/congviec.dart';
import '../widgets/new_congviec.dart';

class CongViecList extends StatefulWidget {
  final List<CongViec> danhSachCongViec;

  CongViecList(this.danhSachCongViec);

  @override
  _CongViecListState createState() => _CongViecListState();
}



       

class _CongViecListState extends State<CongViecList> {
  void _xoaCongViec(int index) {
    setState(() {
      // xóa vị trí index
      widget.danhSachCongViec.removeAt(index);
    });
  }


Widget build(BuildContext context) {
  
  return Container(
    height: 500,
    child: SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.danhSachCongViec.asMap().entries.map((entry) { // đổi list sang map( key: value)
          int index = entry.key;
          CongViec congviec = entry.value;
          bool isOverdue = congviec.deadline.isBefore(DateTime.now());
          return Dismissible( // cái này bao quanh mỗi phần tử của danh sách
            key: UniqueKey(),
            onDismissed: (direction) {
              _xoaCongViec(index);
            },
            background: Container(
              color: Colors.red,
              child: Icon(Icons.delete, color: Colors.white),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
            ),
            child: Card(
              child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                children: <Widget>[

                  Expanded(
                    child: Text(
                      congviec.nameCongViec,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: isOverdue ? Colors.red : Colors.purple,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        DateFormat('dd-MM-yyyy HH:mm').format(congviec.deadline),
                        style: TextStyle(
                          color: isOverdue ? Colors.red : Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            ),
          );
        }).toList(),
      ),
    ),
  );
}





}




