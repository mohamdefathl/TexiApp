import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MessageingController extends GetxController {
  String? deliveryMessageToken;
  String? customerMessageToken;

  Future<void> sendDeliveryMessageToken(String orderCode) async {
    print(orderCode);
    deliveryMessageToken = await getMessageToken();
    await FirebaseFirestore.instance.collection('messages').doc(orderCode).set({
      'deliveryToken': deliveryMessageToken,
      'customerToken': deliveryMessageToken,
      'createdAt': DateTime.now(),
    });
  }

  Future<void> getCustomerMessageToken(String orderCode) async {
    print(orderCode);
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('messages')
        .doc(orderCode)
        .get();
    if (documentSnapshot.exists) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      customerMessageToken = data['customerToken'];
      print('Customer Token: $customerMessageToken');
    } else {
      print('Document does not exist');
    }
    
  }

  Future getMessageToken() async {
    return await FirebaseMessaging.instance.getToken();
  }
}
