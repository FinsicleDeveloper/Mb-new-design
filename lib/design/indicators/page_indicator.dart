import 'package:design/design/indicators/widgets/streambuilder.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';





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





class WarningText{
  static const String messge = "This information does not constitute a personal recommendation for your actions, so please refrain from considering the data as investment advice. As with any trade, it is essential to conduct thorough research before making any decisions.\n";
}












