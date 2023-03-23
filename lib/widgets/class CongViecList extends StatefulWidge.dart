// class CongViecList extends StatefulWidget {
// final List<CongViec> danhSachCongViec;

// CongViecList(this.danhSachCongViec);

// @override
// _CongViecListState createState() => _CongViecListState();
// }

// class _CongViecListState extends State<CongViecList> {
// void _xoaCongViec(int index) {
// setState(() {
// widget.danhSachCongViec.removeAt(index);
// });
// }

// Widget build(BuildContext context) {
// return Container(
// height: 300,
// child: SingleChildScrollView(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: widget.danhSachCongViec.asMap().entries.map((entry) {
// int index = entry.key;
// CongViec congviec = entry.value;
// return InkWell(
// onTap: () {
// Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => CongViecDetailPage(congViec)),
// );
// },
// child: Dismissible(
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
// child: Row(
// children: <Widget>[
// Container(
// margin: EdgeInsets.symmetric(
// vertical: 10,
// horizontal: 15,
// ),
// decoration: BoxDecoration(),
// padding: EdgeInsets.all(10),
// child: Text(
// congviec.nameCongViec,
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 20,
// color: Colors.purple,
// ),
// ),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// Text(
// DateFormat('dd-MM-yyyy').format(congviec.deadline),
// style: TextStyle(
// color: Colors.grey,
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
// );
// }
// }





// child: Card(
//   child: InkWell(
//     onTap: () {
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => CongViecDetail(congviec),
//         ),
//       );
//     },
//     child: Row(
//       children: <Widget>[
//         //...
//       ],
//     ),
//   ),
// ),