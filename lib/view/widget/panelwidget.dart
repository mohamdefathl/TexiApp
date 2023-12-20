import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/data/models/ongoaing_model.dart';
import 'package:taxiapp/view/widget/general/CardMessageRow.dart';

class PanelWidget extends StatelessWidget {
  const PanelWidget(
      {Key? key,
      required this.controller,
      required this.panelController,
      required this.onGoaingOrderModel, required this.onClickCancel, required this.onClickDeliverd, required this.onClickChat})
      : super(key: key);

  final ScrollController controller;
  final PanelController panelController;
  final OnGoaingOrderModel onGoaingOrderModel;
  final VoidCallback  onClickCancel;
  final VoidCallback onClickDeliverd;
  final VoidCallback onClickChat;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: controller,
      children: [
        const SizedBox(
          height: 18,
        ),
        buildDragHandle(panelController),
        const SizedBox(
          height: 18,
        ),
        Text(
          "الطلب # ${onGoaingOrderModel.codeNumber}",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColor.primary),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "الطلب في الطريق",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.grey, fontSize: 12),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
          ),
          child: Divider(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CardMessageRow(
                phoneNumber: "${onGoaingOrderModel.customer!.phone}"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  onGoaingOrderModel.customer!.fullName!,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  "${onGoaingOrderModel.customer!.phone}",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CardPanelWidget(
                  onClick: onClickCancel,
                  title: "الغاء",
                  icon: Icons.cancel_presentation),
              CardPanelWidget(
                  onClick: onClickDeliverd,
                  title: "تم الإيصال ",
                  icon: Icons.check_rounded),
              CardPanelWidget(
                onClick: onClickChat,
                title: "الدردشة ",
                icon: Icons.chat,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CardPanelWidget extends StatelessWidget {
  const CardPanelWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onClick,
  });
  final String title;
  final IconData icon;
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        children: [
          Card(
            elevation: 1.3,
            color: Theme.of(context).colorScheme.scrim,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                icon,
                color: AppColor.primary,
                size: 25,
              ),
            ),
          ),
          Text(
            title,
            style:
                Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}

void togglePanel(PanelController panelController) {
  panelController.isPanelOpen
      ? panelController.close()
      : panelController.open();
}

Widget buildDragHandle(PanelController panelController) {
  return GestureDetector(
    child: Center(
      child: Container(
        width: 30,
        height: 5,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(12)),
      ),
    ),
    onTap: () => togglePanel(panelController),
  );
}
