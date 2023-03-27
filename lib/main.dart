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




void addNewCongViec( String nameCongViec,  DateTime deadline) {
    final NewCongViec = CongViec(

      nameCongViec: nameCongViec,
      deadline: deadline, 
    );
    setState(() {
      danhSachCongViec.add(NewCongViec);
    });
}

  

  void startaddNewCongViec(BuildContext context) {

    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewCongViec(addNewCongViec),  

          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản Lý Công Việc'),

      ),
      body: SingleChildScrollView(
        
        child: Center(
          child: Container(
            child: Column(
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
                SizedBox(height: 16.0),
                CongViecList(danhSachCongViec),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startaddNewCongViec(context),
      ),
    );
  }
}

