import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';

class MoInput extends StatelessWidget {
  const MoInput({
    Key? key,
    this.title,
    this.icon2,
    this.obscure,
    this.nameText,
    this.ontap,
    this.valid,
  }) : super(key: key);

  final String? title;
  final IconData? icon2;
  final bool? obscure;
  final TextEditingController? nameText;
  final VoidCallback? ontap;
  final String? Function(String?)? valid;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.075,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          textInputAction: TextInputAction.next,
          validator: valid,
          controller: nameText,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w400,
          ),
          obscureText: obscure!,
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            errorStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.red.shade700,fontSize: 11),
            contentPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide:
                    const BorderSide(color: AppColor.primary, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide:
                    const BorderSide(color: AppColor.primary, width: 2.5)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide:
                    const BorderSide(color: AppColor.primary, width: 1)),
            prefixIcon: IconButton(
              onPressed: ontap,
              icon: Icon(
                icon2,
                color: AppColor.primary,
              ),
            ),
            labelText: title,
            labelStyle: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.grey),
            fillColor: Theme.of(context).colorScheme.background,
            filled: true,
          ),
        ),
      ),
    );
  }
}
