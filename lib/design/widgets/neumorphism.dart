// import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
// import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';


// import '../../constants/appcolors.dart';

// class NeumorphismContainer extends StatelessWidget {
//   const NeumorphismContainer({
//     super.key,
//     required this.child,
//     required this.inset,
//     this.distance = const Offset(4, 4),
//     this.blur = 15, this.circular= 30,
//   });
//   final Widget child;
//   final bool inset;   
//   final Offset distance;
//   final double blur;
// final double circular;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(circular), 
//             color:AppColors.kbgcolor,
//             boxShadow: [
//               BoxShadow(  
//                   offset: -distance,
//                   color: AppColors.kWhite,
//                   inset: inset,
//                   spreadRadius: 1,
//                   blurRadius: blur),
//               BoxShadow(
//                   offset: distance,
//                   color:const Color(0XFFBEBEBE), 
//                   blurRadius: blur,
//                   spreadRadius: 1,
//                   inset: inset)
//             ],
//             //             gradient: const LinearGradient(
//
//
//begin: Alignment.topLeft,
//             // end: Alignment.bottomRight,
//             // colors: [
//             //   Color(0XFFc1c1c1),
//             //   Color(0XFFE5E5E5)
              
//             // ],
//             // stops: [
//             //   0,
//             //   1
//             // ]
            
            
//             // ),   
            
            
//             ),
//         child: child,
//       ),
//     );
//   }
// }
