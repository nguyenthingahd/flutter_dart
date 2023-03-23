import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import '../models/congviec.dart';
import '../widgets/new_congviec.dart';
import '../widgets/CongViecDetail.dart';

class CongViecList extends StatefulWidget {
  final List<CongViec> danhSachCongViec;

  CongViecList(this.danhSachCongViec);

  @override
  _CongViecListState createState() => _CongViecListState();
}










class _CongViecListState extends State<CongViecList> {
  void _xoaCongViec(int index) {
    setState(() {
      widget.danhSachCongViec.removeAt(index);
    });
  }



Widget build(BuildContext context) {

  
  return Container(
    // set chiều dài của độ hiển thị
    height: 500,
    child: SingleChildScrollView(
      // có thể cuộn bao nhiêu công iveej ccungx đc 
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.danhSachCongViec.asMap().entries.map((entry) {
          int index = entry.key;
          CongViec congviec = entry.value;
          bool isOverdue = congviec.deadline.isBefore(DateTime.now());
          return Dismissible(
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
                  // Sử dụng expanded Expanded widget để giãn Text widget của công viejc sao cho nó chếm hết không gian còn lại trong row widget
                  // SizedBox widget với kích thước width là 20 để tạo khoảng cách giữa hai phần tử tên công việc và deadline. 
                  //Text widget của deadline vào một Column widget để nó được căn chỉnh theo chiều dọc.
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
                        DateFormat('dd-MM-yyyy HH:mm:ss').format(congviec.deadline),
                        style: TextStyle(
                          // thay đổi màu nếu quá hạn : isoverdue
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





//   Widget build(BuildContext context) {
// final TextEditingController _searchController = TextEditingController();

// return Column(
// children: [
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: TextFormField(
// controller: _searchController,
// decoration: InputDecoration(
// labelText: 'Tìm kiếm công việc',
// suffixIcon: IconButton(
// icon: Icon(Icons.clear),
// onPressed: () {
// _searchController.clear();
// },
// ),
// ),
// onChanged: (value) {
// setState(() {});
// },
// ),
// ),
// Expanded(
// child: Container(
// height: 500,
// child: SingleChildScrollView(
// physics: AlwaysScrollableScrollPhysics(),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: widget.danhSachCongViec
// .where((congviec) => congviec.nameCongViec
// .toLowerCase()
// .contains(_searchController.text.toLowerCase())).toList().asMap()
// .entries
// .map((entry) {
// int index = entry.key;
// CongViec congviec = entry.value;
// bool isOverdue = congviec.deadline.isBefore(DateTime.now());
// return Dismissible(
// key: UniqueKey(),
// onDismissed: (direction) {
// _xoaCongViec(index);
// },
// background: Container(
// color: Colors.red,
// child: Icon(Icons.delete, color: Colors.white),
// alignment: Alignment.centerRight,
// padding: EdgeInsets.only(right: 20),
// ),
// child: Card(
// child: Padding(
// padding:
// EdgeInsets.symmetric(vertical: 10, horizontal: 15),
// child: Row(
// children: <Widget>[
// Expanded(
// child: Text(
// congviec.nameCongViec,
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 20,
// color: isOverdue ? Colors.red : Colors.purple,
// ),
// ),
// ),
// SizedBox(width: 20),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// Text(
// DateFormat('dd-MM-yyyy HH:mm:ss')
// .format(congviec.deadline),
// style: TextStyle(
// color: isOverdue ? Colors.red : Colors.grey,
// fontSize: 20,
// fontWeight: FontWeight.bold,
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// );
// }).toList(),
// ),
// ),
// ),
// ),
// ],
// );
// }
