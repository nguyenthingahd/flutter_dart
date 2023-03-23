import 'package:flutter/material.dart';
import 'widgets/new_congviec.dart';
import 'widgets/list_congviec.dart';
import 'models/congviec.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<CongViec> danhSachCongViec = [

  ];

// add công việc mới vào danh sách ( danhSachCongViec )  
// khi đc gọi nó sẽ tạo một đối tượng tên NewCongViec có kiểu là CongViec
// và thêm vào danh sách công việc 
// sử dụng setState để báo cho flutter biết là trạng thái Stateful Widget đã đc thay đổi và vẽ lại
void addNewCongViec( String nameCongViec,  DateTime deadline) {
    final NewCongViec = CongViec(

      nameCongViec: nameCongViec,
      deadline: deadline, // Use the passed DateTime object
      // diemTotNghiep: diemTotNghiep,
    );
    setState(() {
      danhSachCongViec.add(NewCongViec);
    });
}

  
// tạo một modal bottom ( cửa sổ modal hiển thị từ dưới lên , để ng dùng nhập )
  void startaddNewCongViec(BuildContext context) {
    // để hiển thị 1 modal bottom 
    showModalBottomSheet(
      context: context,
      // _ là chỉ định 1 biến không cần thiết, kiểu showModalBottomSheet yêu cần 1 tham số truyển vào nhưng k cần truyển
      builder: (_) {
        // Ges : để sử lý mấy củ chỉ kiểu chạm, vuốt , người dùng tương tác với Newcongviec( thêm công việc vào ) bằng cử chỉ 
        return GestureDetector(
          // ontap : callback function : không có hành động nào đc thực hiện khi chạm vào gesture
          onTap: () {},
          child: NewCongViec(addNewCongViec),  //NewCongViec là class trong new_congviec , hiển thị giao diện cho phép người dùng nhập 
                                                // khi mà ấn submit thì Hàm NewCongViec sẽ đc gọi, và hàm AddNEwcongviec đc gọi để thêm vào danh sách

          // behavior : đc sử dụng để bảo đảm rằng ontap chỉ được kích hoạt khi người dùng ấn vào phần tử , chứ không phải mấy cái linh tinh
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }



  @override
  // build : xây dụng giao diện 
  Widget build(BuildContext context) {
    // Scaffold : cấu hình giao diện
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản Lý Công Việc'),

      ),
      // SingleChildScrollView : cho phép cuộn nếu nội dung dài
      body: SingleChildScrollView(
        child: Center(
          // Container chứa 1 columns va 2 phần tử con : card widget và CongViecList widget
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 25, 0, 0), // thêm margin top 25 ( trái trên phải dưới )
            child: Column(
              // <Widget> : khai báo các widget con nằm trong widgets cha 
              children: <Widget>[
                const Card(
                  color: Color.fromARGB(255, 213, 225, 234),
                  elevation: 20,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Danh Sách Công Việc',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 17, 224, 13),
                      ),
                    ),
                  ),
                ),
                // SizeBox nằm giữa ở đây để căn giữa chúng cách nhau , là columns nên nó sẽ cách đều trên dưới 
                // trng trườn hợp này k wan trọng lắm 
                SizedBox(height: 16.0),
                // 1 dạng listview
                CongViecList(danhSachCongViec),
              ],
            ),
          ),
        ),
      ),
      // xác định vị trí tạo nút bấm 
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // tạo nút bấm
      floatingActionButton: FloatingActionButton(
        // nút bấm là dấu + , có thể thêm ảnh ( đang bug)
        child: Icon(Icons.add),
        // bấm vào cái n ày thì hàm tạo danh sách thêm công việc
        onPressed: () => startaddNewCongViec(context),
      ),
    );
  }
}