


import 'package:flutter/material.dart';

import 'con.dart';

class TimerSlider extends StatelessWidget {
  const TimerSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: con(Slider(
          activeColor: Colors.white, max: 10, value: 1.1, onChanged: (d) {})),
    );
  }
}