import 'package:design/constants/appcolors.dart';
import 'package:design/design/login/functions/login_functions.dart';
import 'package:flutter/material.dart';

// enum LoginType {
//   // ignore: constant_identifier_names
//   Apple,
//   Google
// }

class PageLogin extends StatelessWidget {
  const PageLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbgcolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
          Center(child: loginButton(key: 'Apple')),
          space(),
          //  const Or(),
          space(),
          Center(child: loginButton(key: 'Google')),
        ],
      ),
    );
  }

  SizedBox space() => const SizedBox(
        height: 10,
      );

  Container loginButton({required String key}) {
    return con(SizedBox(
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
            key == 'Google'
                ? const SizedBox(
                    width: 10,
                  )
                : const SizedBox(),
            Image.asset(
              'assets/images/$key.png',
              width: key == 'Google' ? 28 : null,
            ),
            key == 'Google'
                ? const SizedBox(
                    width: 10,
                  )
                : const SizedBox(),
            Text("Sign in with $key")
          ],
        ),
      ),
    ));
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
