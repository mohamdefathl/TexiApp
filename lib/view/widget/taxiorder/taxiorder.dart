import 'package:flutter/material.dart';
import 'package:taxiapp/data/models/taxi_orders_model.dart';
import 'package:taxiapp/view/widget/general/CardMessageRow.dart';
import 'package:taxiapp/view/widget/history/historyTitlewithIcon.dart';
import 'package:taxiapp/view/widget/orders/order.dart';

class TaxiOrder extends StatelessWidget {
  const TaxiOrder(
      {super.key, required this.taxiOrderModel, required this.onTap});
  final TaxiOrderModel taxiOrderModel;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  "الطلب #${taxiOrderModel.orderNumber}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.07),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.02,
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HistoryMainTitleWithIcon(
                              themeText: Theme.of(context).textTheme,
                              image: "assets/images/user.png",
                              title: "معلومات الزبون",
                            ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04,
                  ),
                  
                  child: Row(
                    children: [
                      CardMessageRow(
                          phoneNumber: taxiOrderModel.customer.phone),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            taxiOrderModel.customer.fullName,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            taxiOrderModel.customer.phone,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: Colors.green),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                OrderSourceDestenation(
                  fromTo: " : موقع الاستقبال",
                  street: taxiOrderModel.pickupLocation,
                  icon: Icons.location_on_outlined,
                  haveIcon: true,
                ),
                OrderSourceDestenation(
                  fromTo: " : الوجهة",
                  street: taxiOrderModel.destination,
                  icon: Icons.location_on_outlined,
                  haveIcon: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
