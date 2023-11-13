import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/view/pages/map.dart';
import 'package:taxiapp/view/widget/detail/orderInDetail.dart';
import 'package:taxiapp/view/widget/elevatedButton.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackSecond,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Card(
              color: AppColor.black,
              child: IconButton(
                onPressed: () {
                  Navigator.maybePop(context);
                },
                icon: Icon(Icons.arrow_forward_ios_sharp),
              ),
            ),
          )
        ],
        iconTheme: IconThemeData(color: AppColor.secondary),
        backgroundColor: AppColor.blackSecond,
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
            CustomElevatedButton(
              title: "عرض السعر والمسافة",
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      backgroundColor: AppColor.black,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        padding: EdgeInsets.zero,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: CustomMap(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomElevatedButton(
                                      title: "العودة",
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }),
                                  CustomElevatedButton(
                                      title: "أخذ الطلب",
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
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
            ),
          ],
        ),
      ),
    );
  }
}
