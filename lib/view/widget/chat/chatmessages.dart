import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/data/models/ongoaing_model.dart';

class ChatMassegs extends StatelessWidget {
  const ChatMassegs({
    super.key,
    required this.scrollController,
    required this.onGoaingOrder,
    required this.chatOrderKey,
  });
  final ScrollController scrollController;
  final OnGoaingOrderModel onGoaingOrder;
  final String chatOrderKey;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('messages')
          .doc(
            chatOrderKey,
          )
          .collection('order')
          .orderBy(
            'createdAt',
          )
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        var messages = snapshot.data!.docs;

        return Padding(
          padding: const EdgeInsets.only(
            // top: 18.0,
            left: 18.0,
            right: 18.0,
          ),
          child: ListView.builder(
            itemCount: messages.length,
            controller: scrollController,
            itemBuilder: (context, index) {
              var message = messages[index]['text'];
              var createdAt = messages[index]['createdAt'] as Timestamp;

              var formattedTime =
                  DateFormat('h:mm a', 'ar').format(createdAt.toDate());
              var deliveryId = messages[index]['deliveryId'];
              var isSentByDelivery = onGoaingOrder.delivery == deliveryId;

              return Container(
                margin: const EdgeInsets.all(10),
                alignment: !isSentByDelivery
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    crossAxisAlignment: !isSentByDelivery
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      Card(
                        color:
                            isSentByDelivery ? AppColor.primary : Theme.of(context).colorScheme.background,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft:
                                Radius.circular(!isSentByDelivery ? 0 : 30),
                            bottomRight:
                                Radius.circular(isSentByDelivery ? 0 : 30),
                            topLeft: const Radius.circular(30),
                            topRight: const Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            message,
                            textAlign: TextAlign.end,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: !isSentByDelivery
                                      ? Theme.of(context).colorScheme.secondary
                                      : Colors.white,
                                ),
                          ),
                        ),
                      ),
                      Text(
                        formattedTime,
                        style:const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
