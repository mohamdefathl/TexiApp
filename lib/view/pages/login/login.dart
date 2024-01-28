import 'dart:async';



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/controllers/login_controller.dart';


import 'package:taxiapp/view/widget/login/button.dart';
import 'package:taxiapp/view/widget/login/inputFiled.dart';


class Login extends StatelessWidget {
  Login({super.key});

  final LoginController _loginController = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Text(
                "مندوب",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.grey, fontSize: 10),
              ),
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/loginpage.png',
                        width: 350,
                      ),
                      Text(
                        " مرحباً بعودتك في تحت امرك",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        "قم بتسجيل دخولك ",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      MoInput(
                        obscure: false,
                        title: "إسم المستخدم",
                        icon2: Icons.person,
                        nameText: _loginController.nameText,
                        valid: (value) {
                          if (value!.isEmpty) {
                            return "يرجى إدخال اسم المستخدم";
                          } else {
                            return null;
                          }
                        },
                      ),
                      
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      MoInput(
                        obscure: true,
                        title: "كلمة المرور",
                        icon2: Icons.key,
                        nameText: _loginController.passText,
                        ontap: () {},
                        valid: (value) {
                          if (value!.isEmpty) {
                            return "يرجى إدخال كلمة المرور";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      // Spacer(),
                      ButtonMo(
                        onTap: () async {
                          if (!_formKey.currentState!.validate()) {
                            bool isConnected =
                                await _loginController.isConnectedToWifi();
                            if (isConnected) {
                              Get.dialog(const Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.primary,
                                ),
                              ));
                              try {
                                await _loginController
                                    .login()
                                    .timeout(const Duration(seconds: 18));
                              } catch (e) {
                                Get.back();
                                if (e is TimeoutException) {
                                  _loginController.printMessage(
                                    'حدث خطأ ما ,يرجى التاكد من صحة الانترنت واعادة المحاولة',
                                    'حدث خطاً ما',
                                  );
                                } else {
                                  _loginController.printMessage(
                                    'يرجى التحقق من اتصال الإنترنت والمحاولة مرة أخرى.',
                                    'خطأ',
                                  );
                                }
                              }
                            } else {
                              _loginController.printMessage(
                                'يرجى الاتصال بالإنترنت والمحاولة مرة أخرى.',
                                'لا يوجد اتصال بالإنترنت',
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
