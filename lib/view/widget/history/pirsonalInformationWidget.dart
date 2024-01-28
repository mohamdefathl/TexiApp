import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiapp/controllers/user_controller.dart';

class PersonalInformationWidget extends StatelessWidget {
  PersonalInformationWidget({
    Key? key,
  }) : super(key: key);

  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.015,
        ),
        child: Card(
          color: const Color(0xFF268DFF),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF439FFF),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(300),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: MediaQuery.of(context).size.height * 0.29,
                ),
              ),
              GetBuilder<UserController>(
                builder: (_) {
                  final fullName =
                      _.user?['full_name'] ?? ''; // Handle null for full_name
                  final phone = _.user?['phone'] ?? ''; // Handle null for phone

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                fullName,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontSize: 13, color: Colors.white),
                              ),
                              Text(
                                phone,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: Colors.white, fontSize: 13),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.04),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/man.jpg'),
                              radius: 40,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
