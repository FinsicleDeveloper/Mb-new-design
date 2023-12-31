import 'package:design/constants/appcolors.dart';
import 'package:design/design/indicators/widgets/guage.dart';
import 'package:flutter/material.dart';

class PAGE2 extends StatelessWidget {
  const PAGE2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.amber,
        backgroundColor: Colors.grey[900],
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                con(const Icon(
                  Icons.punch_clock_outlined,
                  color: Colors.white,
                )),
                con(const Icon(
                  Icons.punch_clock_outlined,
                  color: Colors.white,
                )),
                con(const Icon(
                  Icons.punch_clock_outlined,
                  color: Colors.white,
                )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: con(const SizedBox(
                height: 200,
                child: Row(
                  children: [
                    Expanded(child: Guage(needleValue: 50)),
                    Expanded(
                        child: Guage(
                      needleValue: 50,
                      isOsillator: true,
                    ))
                  ],
                ),
              )),
            ),
            const SizedBox(
              width: 200,
            ),
          ],
        ),
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
