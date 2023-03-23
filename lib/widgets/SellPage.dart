import 'package:flutter/material.dart';

import 'list_congviec.dart';


class SellPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Đây là trang bán hàng'),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.add))
          ]
      ),
      body: Card(
        elevation: 5,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),

        ),
      ),
    );
  }
}
