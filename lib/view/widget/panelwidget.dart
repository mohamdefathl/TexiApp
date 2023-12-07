import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:taxiapp/view/widget/general/cardMassageCall.dart';

class PanelWidget extends StatelessWidget {
  const PanelWidget(
      {Key? key, required this.controller, required this.panelController})
      : super(key: key);

  final ScrollController controller;
  final PanelController panelController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: controller,
      children: [
        SizedBox(
          height: 18,
        ),
        buildDragHandle(panelController),
        SizedBox(
          height: 18,
        ),
        Text(
          "الطلب # 3023",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
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
          height: 18,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(),
        ),
        SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CardMassageCall(
                  icon: Icons.call,
                  iconColor: Colors.greenAccent,
                  service: 'tel',
                  phoneNumber: "orderModel.customer!.phone!",
                ),
                const SizedBox(
                  width: 10,
                ),
                CardMassageCall(
                  icon: Icons.message,
                  iconColor: Colors.blue,
                  service: 'sms',
                  phoneNumber: "orderModel.customer!.phone!",
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "محمد فضل الغرباني",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  "778940511",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            )
          ],
        )
      ],
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
