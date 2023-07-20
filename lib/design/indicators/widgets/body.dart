import 'package:design/design/indicators/widgets/color_bars.dart';
import 'package:design/design/indicators/widgets/timer_slider.dart';
import 'package:flutter/material.dart';

import 'animated_button_bar.dart';
import 'con.dart';
import 'guage.dart';
import 'title_widget.dart';

SafeArea body(var x, y, BuildContext ctx,    List<Map<String, dynamic>> top7OiValues,) {
  return SafeArea(
    child: Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          const TitleWidget(),
          const SizedBox(
            height: 10,
          ),
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
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: con(ColorBars(topOiValues: top7OiValues,)),
          )
          //  const TimerSlider()
        ],
      ),
    ),
  );
}
