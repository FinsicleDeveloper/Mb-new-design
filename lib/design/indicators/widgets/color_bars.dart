import 'package:flutter/material.dart';

class ColorBars extends StatefulWidget {
 // final List<Map<String, dynamic>> topOiValues;
  const ColorBars({
    Key? key,
    //required this.topOiValues,
  }) : super(key: key);

  @override
  State<ColorBars> createState() => _ColorBarsState();
}

class _ColorBarsState extends State<ColorBars> {
  List<Color> vibrantColors = const [
    Color(0xFFE91E63), // Pink
    Color(0xFF3F51B5), // Indigo
    Color(0xFF00BCD4), // Cyan
    Color(0xFF4CAF50), // Green
    Color(0xFFFFC107), // Amber
    Color(0xFFFF5722), // Deep Orange
    Color(0xFF795548), // Brown
  ];

  @override
  Widget build(BuildContext context) {
    // int totalOi = 0;

    // for (final object in widget.topOiValues) {
    //   final oi = object['oi'] as int;
    //   totalOi += oi;
    // }

    // final calculatedValue = totalOi * 100;

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 3),
      child: ListView.builder(
        itemCount: vibrantColors.length,
        itemBuilder: (context, index) {
          // final object = widget.topOiValues[index];

          // final oi = object['oi'] as int;
          // final maxWidth = oi.toDouble() / calculatedValue.toDouble();

          // final double containerWidth =
          //     MediaQuery.of(context).size.width * (maxWidth / 100);
          return Row(
            children: [
         const      Text(
                "lorem ipsum",
                // object['name']
                //     .toString()
                //     .substring(object['name'].toString().length - 7),
                style:
                  TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.left,
                
              ),
              Expanded(
                flex: 6,
                child: Container(
                  width: 120,
                //  width: containerWidth,
                  height: 3,
                  color: vibrantColors[index],
                ),
              ),
           const    Text(
                "320",
               // object['oi'].toString(),
                style:  TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                textAlign: TextAlign.right,
              ),
            ],
          );
        },
      ),
    );
  }
}
