import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Guage extends StatelessWidget {
  const Guage({
    super.key,
    required this.needleValue,
    this.isOsillator = false,
  });
  final double needleValue;
  final bool isOsillator;
  final double guageWidth = 28  ;       
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          // minorTickStyle: MinorTickStyle(color: Colors.green,),
          //majorTickStyle: MajorTickStyle(color: Colors.white),
          minimum: 0,
          maximum: 100,
          showLabels: true,
          // annotations:  [
          //    GaugeAnnotation(
          //     angle: 36,
          //     positionFactor: 0.6,
          //     widget: Text(
          //       !isOsillator ? "Strong Sell" : "Extreme fear",
          //       style: const TextStyle(fontFamily: "Lora", color: Colors.amber),
          //     ),
          //   ),
          // ],
          ranges: <GaugeRange>[
            GaugeRange(
              startWidth: guageWidth,
              endWidth: guageWidth,
              startValue: 0,
              endValue: 20,
              color: !isOsillator ? Colors.red : Colors.green,
              label: !isOsillator ? "Strong\nSell" : "Extreme\nfear",
              labelStyle: labelStyle(),
            ),
            GaugeRange(
                startWidth: guageWidth,
                endWidth: guageWidth,    
                startValue: 20,
                endValue: 40,
                color: isOsillator
                    ? const Color.fromARGB(255, 128, 201, 130)
                    : const Color.fromARGB(255, 252, 101, 90),
                label: !isOsillator ? "Sell" : "Fear",
                labelStyle: labelStyle()),
            GaugeRange(
                startWidth: guageWidth,
                endWidth: guageWidth,
                labelStyle: labelStyle(),
                startValue: 40,
                endValue: 60,
                color: const Color.fromARGB(255, 248, 171, 54),
                label: !isOsillator ? "Neutral" : "Stable"),
            GaugeRange(
                startWidth: guageWidth,
                endWidth: guageWidth,
                startValue: 60,
                endValue: 80,
                color: !isOsillator
                    ? const Color.fromARGB(255, 128, 201, 130)
                    : const Color.fromARGB(255, 252, 101, 90),
                label: !isOsillator ? "Buy" : "Greed",
                labelStyle: labelStyle()),
            GaugeRange(
                startWidth: guageWidth,
                endWidth: guageWidth,
                startValue: 80,
                endValue: 100,
                color: isOsillator ? Colors.red : Colors.green,
                label: !isOsillator ? "Strong\nBuy" : "Extreme\nGreed",
                labelStyle: labelStyle())
          ],
          pointers: <GaugePointer>[
            NeedlePointer(
              enableAnimation: true,
              needleEndWidth: 4,
              needleStartWidth: 0,
              needleLength: 0.7,
              knobStyle: const KnobStyle(color: Colors.white, knobRadius: 0.08),
              value: needleValue,
              needleColor: Colors.white70,
            )
          ],
        )
      ],
    );
  }

  GaugeTextStyle labelStyle() => const GaugeTextStyle(
      fontFamily: "Lora", fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold);
}
