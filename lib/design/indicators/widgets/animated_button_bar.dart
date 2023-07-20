import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:design/design/indicators/functions/changer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
            Provider.of<ChangerProvider>(ctx, listen: false).setmins('1 mins');
          },
          child: const Text("1M")),
      ButtonBarEntry(
          onTap: () {
            HapticFeedback.mediumImpact();
            Provider.of<ChangerProvider>(ctx, listen: false).setmins('5 mins');
          },
          child: const Text("5M")),
      ButtonBarEntry(
          onTap: () {
            HapticFeedback.mediumImpact();
            Provider.of<ChangerProvider>(ctx, listen: false).setmins('15 mins');
          },
          child: const Text("15M")),
      ButtonBarEntry(
          onTap: () {
            HapticFeedback.mediumImpact();
            Provider.of<ChangerProvider>(ctx, listen: false).setmins('30 mins');
          },
          child: const Text("30M")),
    ],
  );
}
