import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design/constants/appcolors.dart';
import 'package:design/db/functions/mongo_data_base_functions.dart';
import 'package:design/design/indicators/functions/changer_provider.dart';
import 'package:design/design/indicators/widgets/guage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PageIndicator extends StatefulWidget {
  const PageIndicator({super.key});

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

bool isPressed = false;

class _PageIndicatorState extends State<PageIndicator> {
  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref('market');
    return stremBuilder(ref);
  }
}

//strem Builder
StreamBuilder<DatabaseEvent> stremBuilder(DatabaseReference ref) {
  return StreamBuilder(
    stream: ref.orderByChild('timestamp').onValue,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else {
        if (snapshot.hasData && snapshot.data != null) {
          final data = snapshot.data!.snapshot.value as Map<dynamic, dynamic>?;
          final dataList = data!.values.toList();

          final indicatorPercentage = dataList[301]['NIFTY 50']['spot']
              ['1 mins']['indicator_percentage'];
          final oscillatorPercentage = dataList[301]['NIFTY 50']['spot']
              ['1 mins']['oscillator_percentage'];
          return body(
            indicatorPercentage,
            oscillatorPercentage,
            context,
          );
        } else {
          return const Center(
            child: Text("Someting rong"),
          );
        }
      }
    },
  );
}

//builder

SafeArea body(var x, y, BuildContext ctx) {
  return SafeArea(
    child: Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          animatedButton(ctx),
          const SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: con(SizedBox(
              height: 200,
              child: Row(
                children: [
                  Expanded(child: Guage(needleValue: x)),
                  Expanded(
                      child: Guage(
                    needleValue: y,
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

AnimatedButtonBar animatedButton(BuildContext ctx) {
  return AnimatedButtonBar(
          radius: 32.0,
          padding: const EdgeInsets.all(8.0),
          backgroundColor: Colors.black,
          foregroundColor: Colors.blueGrey.shade300,
          elevation: 24,
          borderColor: Colors.white,
          borderWidth: 2,
          innerVerticalPadding: 16,
          children: [
            ButtonBarEntry(
                onTap: () {
                  HapticFeedback.mediumImpact();
                      Provider.of<ChangerProvider>(ctx, listen: false)
                      .setmins('1 mins');
                },
                child: const Text("1M")),
            ButtonBarEntry(
                onTap: () {
                  HapticFeedback.mediumImpact();
                  Provider.of<ChangerProvider>(ctx, listen: false)
                      .setmins('5 mins');
                },
                child: const Text("5M")),
            ButtonBarEntry(
                onTap: () {
                  HapticFeedback.mediumImpact();
                      Provider.of<ChangerProvider>(ctx, listen: false)
                      .setmins('15 mins');
                },
                child: const Text("15M")),
            ButtonBarEntry(
                onTap: () {
                  HapticFeedback.mediumImpact();
                      Provider.of<ChangerProvider>(ctx, listen: false)
                      .setmins('30 mins');
                },
                child: const Text("30M")),
          ],
        );
}

Container minitueButton(
    {required BuildContext context,
    required String key,
    required String value}) {
  return con(
    FloatingActionButton(
      mini: true,
      backgroundColor: Colors.white,
      onPressed: () {
        Provider.of<ChangerProvider>(context, listen: false).setmins(value);
        HapticFeedback.mediumImpact();
      },
      child: Text(
        key,
        style: const TextStyle(color: Colors.black),
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
        padding: const EdgeInsets.all(6.0),
        child: child,
      ));
}
