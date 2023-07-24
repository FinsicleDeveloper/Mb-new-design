


import 'package:design/design/indicators/functions/timer_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'con.dart';

class TimerSlider extends StatelessWidget {
  const TimerSlider({
    super.key, required this.max,
    required this.timeStamp
  });
  final double max;
  final String timeStamp;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: con(Consumer<TimeChanger>(
      builder: (context, provider, child) => Column(
        children: [
          Text(timeStamp, style: const TextStyle(fontSize: 20),),
          Slider(
                activeColor: Colors.white, max: max, 
                
                    onChanged: (double value) {
                      int docIndex = value.toInt() == max.toInt()
                          ? 0
                          : max.toInt() - value.toInt() - 1;
          
                      provider.changeDocIndex(docIndex);
                      provider.changeInitialPoint(7.0);
                      provider.sliderValue(value);
                     debugPrint('max is $max doc is $docIndex');
                    },
                 value: provider.initialPoint == 0
                      ? max
                      : provider.initialSliderValue
                
                
                ),
        ],
      ),
      )),
    );
  }
}