import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:taxiapp/data/models/ongoaing_model.dart';
import 'package:taxiapp/view/widget/DeliveryWidgets/chat/chat/chatAppbar.dart';
import 'package:taxiapp/view/widget/DeliveryWidgets/chat/chat/chatinput.dart';
import 'package:taxiapp/view/widget/DeliveryWidgets/chat/chat/chatmessages.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatelessWidget {
  final OnGoaingOrderModel onGoaingOrder;

  ChatScreen({super.key, required this.onGoaingOrder});

  final TextEditingController _textController = TextEditingController();

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    String chatOrderKey = "${onGoaingOrder.codeNumber}${onGoaingOrder.id}";
    return Scaffold(
      
      // backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
        child: ChatAppBar(onGoaingOrder: onGoaingOrder),
      ),
      body: Column(
        children: [
          Expanded(
              child: ChatMassegs(
                chatOrderKey: chatOrderKey,
            onGoaingOrder: onGoaingOrder,
            scrollController: scrollController,
          )),
          ChatInput(
            chatOrderKey: chatOrderKey,
            textController: _textController,
            scrollController: scrollController,
            onGoaingOrder: onGoaingOrder,
          ),
        ],
      ),
    );
  }
}

Future<void> sendNotification(String customerToken) async {
  var headersList = {
    'Accept': '*/*',
    'Content-Type': 'application/json',
    'Authorization':
        'key=AAAAOcwZJTQ:APA91bEzFM2tZ5moMMW-sh0c5cDS91kl34jD-_bGKchde1LtqsK_wxNtNdA9gQ2ybxFiG7nW4u5iGcB7d2p9qzvRLZxIYfCYpZQ6fPzyY37DwGSAH36Cv1Z8ZmjeqlPwUVBTawNXIo6G'
  };
  var url = Uri.parse('https://fcm.googleapis.com/fcm/send');

  var body = {
    "to": customerToken,
    "notification": {
      "title": "ass",
      "body": ".ass",
      "mutable_content": true,
      "sound": "Tri-tone"
    },
  };

  var req = http.Request('POST', url);
  req.headers.addAll(headersList);
  req.body = json.encode(body);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();

  if (res.statusCode >= 200 && res.statusCode < 300) {
    print(resBody);
  } else {
    print(res.reasonPhrase);
  }
}
