import 'package:flutter/material.dart';
import 'package:taxiapp/data/models/orders_model.dart';
import 'package:taxiapp/view/widget/detail/titlewithicon.dart';
import 'package:taxiapp/view/widget/detail/userTitle.dart';
import 'package:taxiapp/view/widget/general/CardMessageRow.dart';


class DetailCustomerInfo extends StatelessWidget {
  const DetailCustomerInfo({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleWithIconDetailPage(
          title: 'معلومات الزبون',
          image: 'assets/images/customer.png',
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                UserTitleDetailPage(
                    icon: Icons.person,
                    title: 'اسم',
                    value: orderModel.customer!.fullName!),
                UserTitleDetailPage(
                    icon: Icons.location_on_outlined,
                    title: 'الموقع',
                    value: orderModel.address!),
                UserTitleDetailPage(
                    icon: Icons.call,
                    title: 'رقم الهاتف',
                    value: orderModel.customer!.phone!),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child:CardMessageRow(phoneNumber: orderModel.customer!.phone!)                   
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}