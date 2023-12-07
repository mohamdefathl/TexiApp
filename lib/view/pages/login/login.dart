import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiapp/controllers/login_controller.dart';
import 'package:taxiapp/view/widget/general/dialog.dart';

import 'package:taxiapp/view/widget/login/button.dart';
import 'package:taxiapp/view/widget/login/inputFiled.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final LoginController _loginController = Get.find<LoginController>();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Form(
        key: _formKey,
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/loginpage.png',
                    width: 350,
                    height: 350,
                  ),
                  Column(
                    children: [
                      Text(
                        " مرحباً بعودتك في بساله",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        "قم بتسجيل دخولك ",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 30,
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
                      const SizedBox(
                        height: 30,
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
                      const SizedBox(
                        height: 30,
                      ),
                      ButtonMo(
                        onTap: () async {
                          if (!_formKey.currentState!.validate()) {
                            bool isConnected =
                                await _loginController.isConnectedToWifi();
                            if (isConnected) {
                              await _loginController.login();
                            } else {
                              dialog(
                                  title: "لايوجد اتصال بالانترنت",
                                  content:
                                      "يرجى الاتصال بالانترنت والمحاولة مرة اخرى",
                                  buttonTitle: "المتابعة",
                                  onPress: () {
                                    Get.back();
                                  });
                            }
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
