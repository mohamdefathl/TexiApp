import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/view/widget/detail/orderInDetail.dart';
import 'package:taxiapp/view/widget/elevatedButton.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: Text(
          "الفاتورة",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CustomElevatedButton(title: "عرض السعر والمسافة", onPressed: () {}),
            CustomElevatedButton(title: "قبول الطلب", onPressed: () {}),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OrderInDetail(),
          OrderInDetail(),
          OrderInDetail(),
          SizedBox(
            height: 100,
          )
        ],
      )),
    );
  }
}
