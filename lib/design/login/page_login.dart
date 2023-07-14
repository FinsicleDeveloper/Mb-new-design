import 'package:design/constants/appcolors.dart';
import 'package:design/design/login/functions/login_functions.dart';
import 'package:flutter/material.dart';

class PageLogin extends StatelessWidget {
  const PageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbgcolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: con(SizedBox(
            height: 50,
            width: 180,
            child: InkWell(
              onTap: () {
                try {
                  LoginFunctionsProvider.signInWithApple();
                } catch (e) {
                  print(e.toString());
                }
              },
              child: Row(
                children: [
                  Image.asset('assets/images/apple_logo.png'),
                  const Text("Sign in with Apple")
                ],
              ),
            ),
          ))),
        ],
      ),
    );
  }

  Container con(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            const BoxShadow(
                color: Colors.black,
                offset: Offset(5, 5),
                spreadRadius: 5,
                blurRadius: 15),
            BoxShadow(
                color: Colors.grey.shade800,
                offset: const Offset(-4, -4),
                spreadRadius: 1,
                blurRadius: 15),
          ],
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black, Colors.black],
              stops: [0, 1]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: child,
        ));
  }
}
