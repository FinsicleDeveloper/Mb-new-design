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






// class DropButton extends StatelessWidget {
//   const DropButton({
//     super.key,
//     required this.items,
//     required this.selectedValue,
//   });

//   final List<String> items;
//   final String? selectedValue;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2<String>(

//        items: items
//         .map((String item) => DropdownMenuItem<String>(
//               value: item,
//               child: Text(
//                 item,
//                 style: const TextStyle(
//                   fontSize: 14,color: Colors.white,
//                   fontFamily: 'Lora'
//                 ),
//               ),
//             ))
//         .toList(),
//                 value: selectedValue,
//     onChanged: (String? value) {
      
//     },
//  dropdownStyleData: DropdownStyleData(
//       maxHeight: 200,
//       width: 200,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         color: Colors.black,
//       ),)
      
//       ),
//     );
//   }
// }












