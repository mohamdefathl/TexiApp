import 'package:flutter/material.dart';
import 'package:taxiapp/constant/color.dart';

class MoInput extends StatelessWidget {
  const MoInput(
      {Key? key,
      this.title,
      this.icon2,
      this.obscure,
      this.nameText,
      this.ontap,
      this.valid})
      : super(key: key);
  final String? title;
  final IconData? icon2;
  final bool? obscure  ;
  final TextEditingController? nameText;
  final VoidCallback? ontap;
  final String? Function(String?)? valid;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Directionality(
        
        textDirection: TextDirection.rtl,
        child: TextFormField(
          
          validator: valid,
          controller: nameText,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          obscureText: obscure!,
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            errorStyle: const TextStyle(
                fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
            // focusedErrorBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(16),
            //     borderSide: const BorderSide(color: AppColor.primary, width: 1)),
            // errorBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(16),
            //     borderSide: const BorderSide(color: AppColor.primary, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(color: AppColor.primary, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(color: AppColor.grey, width: 1)),
            prefixIcon: IconButton(            
              onPressed: ontap,
              icon: Icon(
                icon2,
                color: AppColor.primary,
              ),
            ),          
            labelText: title,
            labelStyle: const TextStyle(
              
              color: Colors.black54,
            ),
            fillColor: AppColor.secondary,
            filled: true,
          ),
        ),
      ),
    );
  }
}
