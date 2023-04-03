import 'package:posttest2_068_rahmayanti/constantst.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    this.isObscure = false,
    required this.controller,
  }) : super(key: key);

  final String title, hintText;
  final bool isObscure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: reguler,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: controller,
            cursorColor: kblackColor,
            obscureText: isObscure,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: kblackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
