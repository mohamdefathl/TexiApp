import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:iconsax/iconsax.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/data/models/ongoaing_model.dart';

class ChatInput extends StatelessWidget {
  const ChatInput({
    Key? key,
    required this.textController,
    required this.scrollController,
    required this.onGoaingOrder,
    required this.chatOrderKey,
  }) : super(key: key);

  final TextEditingController textController;
  final ScrollController scrollController;
  final OnGoaingOrderModel onGoaingOrder;
  final String chatOrderKey;

  @override
  Widget build(BuildContext context) {
    print(onGoaingOrder.delivery!);
    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 18.0,
            left: 18.0,
            right: 18.0,
          ),
          child: Row(
            children: [
              Expanded(
                child: Directionality(
                  textDirection: ui.TextDirection.rtl,
                  child: Card(
                    color: textController.text.isNotEmpty
                        ? Colors.white
                        : Colors.grey.shade200,
                    // shadowColor: Colors.grey.shade200,
                    // elevation: 7,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      cursorHeight: MediaQuery.of(context).size.height * 0.035,
                      controller: textController,
                      decoration: InputDecoration(
                        errorStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.red.shade700, fontSize: 11),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical:
                                MediaQuery.of(context).size.height * 0.01),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.7)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.7)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.7)),
                        labelText: "ادخل رسالتك",
                        labelStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.w900,
                                fontSize: 14),
                        fillColor: Theme.of(context).colorScheme.background,
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                color: !textController.text.isNotEmpty
                    ? Colors.grey
                    : AppColor.primary,
                // elevation: 7,
                // shadowColor: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                  splashRadius: 30,
                  icon: const Icon(
                    Iconsax.send_2,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    if (textController.text.isNotEmpty) {
                      await sendMessage(context, textController.text,
                              onGoaingOrder.delivery!, chatOrderKey)
                          .then((value) => textController.clear());

                      _scrollToBottom(scrollController);
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> sendMessage(BuildContext context, String message, int deliverId,
      String chatOrderKey) async {
    await FirebaseFirestore.instance
        .collection('messages')
        .doc(chatOrderKey)
        .collection('order')
        .add({
      'text': message,
      'createdAt': DateTime.now(),
      'deliveryId': deliverId,
    });
  }

  void _scrollToBottom(scrollController) {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
