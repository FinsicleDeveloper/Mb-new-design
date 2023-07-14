import 'package:design/constants/appcolors.dart';
import 'package:design/db/functions/mongo_data_base_functions.dart';
import 'package:design/design/indicators/widgets/guage.dart';
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
   return body(20.0, 30.0);
    // return StreamBuilder(
    //   stream: MongodataBaseFunctions.streamData(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(child: CircularProgressIndicator());
    //     } else {
    //       if (snapshot.hasData) {
    //         final documents = snapshot.data!;

    //         // final x = documents[0]['NIFTY 50']['spot']['1 mins']
    //         //     ['oscillator_percentage'];

    //         // final y = documents[0]['NIFTY 50']['spot']['1 mins']
    //         //     ['indicator_percentage'];
    //         return InkWell(
    //             onTap: () {
    //               print("number of documents Loaded ${documents.length}");
    //             },
    //             child: body(
    //               20.5,
    //               25.3,
    //             ));
    //       } else {
    //         return const Center(
    //           child: Text("Someting rong"),
    //         );
    //       }
    //     }
    //   },
    // );
  }
  SafeArea body(var x, y) {
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
                con(
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {
                 
                    },
                    child: const Text(
                      "1 M",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration:const  Duration(milliseconds: 100),
                  child: con(
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {},
                      child: const Text(
                        "2 M",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
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
