import 'package:design/constants/appcolors.dart';
import 'package:design/design/indicators/widgets/guage.dart';
import 'package:design/design/widgets/neumorphism.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_neumorphic/flutter_neumorphic.dart';
class PageIndicators extends StatefulWidget {
  const PageIndicators({super.key});

  @override
  State<PageIndicators> createState() => _PageIndicatorsState();
}

class _PageIndicatorsState extends State<PageIndicators> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold
    
    (body: SizedBox()));

    
  }
}

class GuageConatiner extends StatelessWidget {
  const GuageConatiner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        child: const Row(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Guage(needleValue: 70),
            )),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Guage(needleValue: 20),
            ))
          ],
        ),
      ),
    );
  }
}
