// Widget build(BuildContext context) {

  
//   return Container(
//     height: 500,
//     child: SingleChildScrollView(
//       physics: AlwaysScrollableScrollPhysics(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: widget.danhSachCongViec.asMap().entries.map((entry) {
//           int index = entry.key;
//           CongViec congviec = entry.value;
//           bool isOverdue = congviec.deadline.isBefore(DateTime.now());
//           return Dismissible(
//             key: UniqueKey(),
//             onDismissed: (direction) {
//               _xoaCongViec(index);
//             },
//             // background: Container(
//             //   color: Colors.red,
//             //   child: Icon(Icons.delete, color: Colors.white),
//             //   alignment: Alignment.centerRight,
//             //   padding: EdgeInsets.only(right: 20),
//             // ),
//             child: Card(
//               child: Padding(
//               padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: Text(
//                       congviec.nameCongViec,

//                     ),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         DateFormat('dd-MM-yyyy HH:mm:ss').format(congviec.deadline),

//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             ),
//           );
//         }).toList(),
//       ),
//     ),
//   );
// }



