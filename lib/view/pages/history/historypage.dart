import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/view/widget/home/order.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "طلباتي",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.97,
                child: Card(
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.only(
                              // topLeft: Radius.circular(30),

                              bottomLeft: Radius.circular(300),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * 0.65,
                          height: MediaQuery.of(context).size.height * 0.29,
                          // height:240,
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "محمد فضل الغرباني",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(fontSize: 13),
                                  ),
                                  Text(
                                    "778940511",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: Colors.grey, fontSize: 13),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 0,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(18.0),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/man.jpg'),
                                  radius: 40,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // ClearYMDwidget(),
                                ClearYMDwidget(
                                  subTitle: "30",
                                  title: 'التوصيلات',
                                ),
                                ClearYMDwidget(
                                  subTitle: "2000 ريال",
                                  title: 'اليوم',
                                ),
                                ClearYMDwidget(
                                  subTitle: "10000 ريال",
                                  title: 'الشهر',
                                ),
                                ClearYMDwidget(
                                  subTitle: "ريال 120000",
                                  title: 'السنة',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "الطلبات النشطة",
                    textAlign: TextAlign.end,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "طلبات تم ايصالها",
                    textAlign: TextAlign.end,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // Order(),
            ],
          ),
        ),
      ),
    );
  }
}

class ClearYMDwidget extends StatelessWidget {
  const ClearYMDwidget({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
        // elevation: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(width: 1, color: Theme.of(context).colorScheme.shadow),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                subTitle,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(title, style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
        ));
  }
}
