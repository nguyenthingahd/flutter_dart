
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
class EditCongViec extends StatefulWidget {
  final Function editCongViec;
  final String congViecId;
  final String congViecName;
  final DateTime congViecDeadline;

  EditCongViec(this.editCongViec, this.congViecId, this.congViecName, this.congViecDeadline);

  @override
  State<EditCongViec> createState() => _EditCongViecState();
}

class _EditCongViecState extends State<EditCongViec> {
  final nameCongViecController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    nameCongViecController.text = widget.congViecName;
    _selectedDate = widget.congViecDeadline;
  }

  void submitData() {
    final enteredNameCongViec = nameCongViecController.text;

    if (enteredNameCongViec.isEmpty || _selectedDate == null) {
      return;
    }

    widget.editCongViec(
      widget.congViecId,
      enteredNameCongViec,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDateTimePicker() {
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1900),
      maxTime: DateTime(3000),
      onConfirm: (date) {
        setState(() {
          _selectedDate = date;
        });
      },
      currentTime: _selectedDate ?? DateTime.now(),
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
                Text(_selectedDate == null ? '' : 'Deadline: ${DateFormat('dd-MM-yyyy HH:mm:ss').format(_selectedDate!)}'),
                SizedBox(width: 5),
                ElevatedButton(
                  child: Text('Chọn Thời Gian'),
                  onPressed: _presentDateTimePicker,
                  style: ElevatedButton.styleFrom(),
                ),
              ],
            ),
            TextButton(
              child: Text('Sửa Công Việc'),
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}