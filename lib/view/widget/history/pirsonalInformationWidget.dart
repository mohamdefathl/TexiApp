import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiapp/controllers/user_controller.dart';

class PersonalInformationWidget extends StatelessWidget {
  PersonalInformationWidget({
    super.key,
  });

  final UserController userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(        
        padding: EdgeInsets.symmetric(
          horizontal:MediaQuery.of(context).size.width * 0.015 ,
          
        ),
        child: Card(
          color: const Color(0xFF268DFF),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    // color: Theme.of(context).colorScheme.surface,
                    color: Color(0xFF439FFF),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(300),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: MediaQuery.of(context).size.height * 0.29,
                  // height:240,
                ),
              ),
              GetBuilder<UserController>(
                builder: (_) {
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
                                _.user!['full_name'],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontSize: 13, color: Colors.white),
                              ),
                              Text(
                                _.user!['phone'],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
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
