import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';
import 'package:taxiapp/view/widget/login/button.dart';
import 'package:taxiapp/view/widget/login/inputFiled.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          reverse: true,
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/login.png',
                    width: 350, 
                    height: 350,
                  ),
                  
                  
                  Text(
                    " مرحباً بعودتك في بساله",
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "قم بتسجيل دخولك ",
                    style: TextStyle(color: AppColor.grey),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MoInput(
                    obscure: false,
                    // nameText: welocome,
                    title: "إسم المستخدم",
                    icon2: Icons.person,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MoInput(
                    obscure: true,
                    // nameText: welocome,
                    title: "كلمة المرور",
                    icon2: Icons.key,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ButtonMo(),
                  // Padding(
                  //     padding: EdgeInsets.only(
                  //         bottom: MediaQuery.of(context).viewInsets.bottom))
                ]),
          ),
        ));
  }
}
