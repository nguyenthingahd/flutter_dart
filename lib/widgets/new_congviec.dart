
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class NewCongViec extends StatefulWidget {
  final Function addCongViec;

  NewCongViec(this.addCongViec);

  @override
  State<NewCongViec> createState() => _NewCongViecState();
}

class _NewCongViecState extends State<NewCongViec> {
  // Text... : Để quản lý nội dung của textfield
  final nameCongViecController = TextEditingController();
  DateTime? _selectedDate; 

  void submitData() {
    // dùng để lấy nội dung từ text field
    final enterednameCongViec = nameCongViecController.text;

    if (enterednameCongViec.isEmpty || _selectedDate == null) {
      return;
    }
    // submit thì sẽ gửi dữ liệu về 
    widget.addCongViec(
      enterednameCongViec,
      _selectedDate,
    );

    Navigator.of(context).pop(); // đóng màn hình hiện tại , khi mà submit thì sẽ đóng thanh nhập thông tin và về màn hình hiển thị thông tin sinh viên

  }

// sử dụng datetime_picker_formfield  để cho phép nhập giờ 
  void _presentDateTimePicker() {
    // DatePi... cho phép ng dùng nhập thười gian 
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true, // hiển thị thanh tiêu đề và các nút action 
      minTime: DateTime(1900),
      maxTime: DateTime(3000),
      // khi người dùng nhập tiem trên DatePicker thì hàm callback Function OnConfirm sẽ gọi với tham số đã chọn 

      onConfirm: (date) {
        setState(() {
          _selectedDate = date;
        });
      },
      // set thời gian trong DatePicker là ngày hiện tai 
      currentTime: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Tên Công Việc'),
              controller: nameCongViecController,
              onSubmitted: (_) => submitData(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 5),
                Padding (
                   padding: const EdgeInsets.only( top: 20),
                  child :ElevatedButton(
                
                  child: Text('Chọn Thời Gian '),
                  onPressed: _presentDateTimePicker,
                    style: ElevatedButton.styleFrom(
                )
                ),
                )

              ],
            ),
            TextButton(
              child: Text('Thêm Công Việc'),
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}