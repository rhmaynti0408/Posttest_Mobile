// import 'package:flutter/cupertino.dart';
import 'package:posttest2_068_rahmayanti/constantst.dart';
import 'package:posttest2_068_rahmayanti/widgets/custom_text_form_field.dart';
import 'package:posttest2_068_rahmayanti/widgets/my_button.dart';
// import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posttest2_068_rahmayanti/models/user.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // LoginPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(_printLatestValue);
    passwordController.addListener(_printLatestValue);
  }

  void _printLatestValue() {
    print('Nama : ${emailController.text}');
    print('Alamat : ${passwordController.text}');
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection() {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 44),
        child: Text(
          "Selamat Datang Di Rahmayanti's Bookstore",
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget formSection() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              title: "Nama",
              hintText: "Nama anda",
              controller: emailController,
            ),
            CustomTextFormField(
              title: "Alamat",
              hintText: "Alamat anda",
              // isObscure: true,
              controller: passwordController,
            ),
            MyButton(
              onTap: () {
                User.email = emailController.text;
                User.password = passwordController.text;
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  'main-page',
                  (route) => false,
                );
              },
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 55,
              text: "Masuk",
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            titleSection(),
            formSection(),
          ],
        ),
      ),
    );
  }
}
