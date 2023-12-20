import 'package:flutter/material.dart';
import 'package:get/get.dart';

dialog(
    {String? title,
    String? content,
    bool? hasCancelButton,
    VoidCallback? confirmOnClick,
    String? confirmTitle,
    VoidCallback? cancelOnClick,
    String? cancelTitle}) {
  Get.defaultDialog(
    
    titlePadding: const EdgeInsets.all(10),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    middleTextStyle:
        const TextStyle(fontFamily: "Cairo", fontSize: 16, color: Colors.grey),
    titleStyle: const TextStyle(
      fontFamily: "Cairo",
      fontSize: 20,
    ),
    title: title!,
    middleText: content!,
    actions: [
      Row(
        mainAxisAlignment: hasCancelButton!
            ? MainAxisAlignment.spaceAround
            : MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: confirmOnClick,
              child: Text(
                confirmTitle!,
                style: const TextStyle(color: Colors.white),
              )),
          hasCancelButton
              ? ElevatedButton(
                  onPressed: cancelOnClick,
                  child: Text(
                    cancelTitle!,
                    style: const TextStyle(color: Colors.white),
                  ))
              : const SizedBox.shrink()
        ],
      )
    ],
  );
}
