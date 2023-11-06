import 'package:flutter/material.dart';
import 'package:taxiapp/view/widget/home/order.dart';
import 'package:taxiapp/view/widget/home/order.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        
        title: Text("الطلبات",style: Theme.of(context).textTheme.titleLarge,),
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Order(
              sourceLocation: "صنعاء -الاصبحي شارع حده قدام الحسحسي ",
              destinationLocation:
                  "حضرموت فسفس عن يسيس صثصث ضضصققيشسي شسي شسيش سيشسيشس",
            ),
            Order(
              sourceLocation: "صنعاء -الاصبحي شارع حده قدام الحسحسي ",
              destinationLocation:
                  "حضرموت فسفس عن يسيس صثصث ضضصققيشسي شسي شسيش سيشسيشس",
            ),
            Order(
              sourceLocation: "صنعاء -الاصبحي شارع حده قدام الحسحسي ",
              destinationLocation:
                  "حضرموت فسفس عن يسيس صثصث ضضصققيشسي شسي شسيش سيشسيشس",
            ),
            Order(
              sourceLocation: "صنعاء -الاصبحي شارع حده قدام الحسحسي ",
              destinationLocation:
                  "حضرموت فسفس عن يسيس صثصث ضضصققيشسي شسي شسيش سيشسيشس",
            ),
          ],
        ),
      ),
    );
  }
}
