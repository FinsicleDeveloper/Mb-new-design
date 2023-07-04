// import 'package:design/constants/appcolors.dart';
// import 'package:design/design/home/widgets/bottom_icon_widget.dart';
// import 'package:design/design/indicators/page_indicators.dart';
// import 'package:flutter/material.dart';
// import 'package:dot_navigation_bar/dot_navigation_bar.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final pageController = PageController();
//   final googleSignIn = GoogleSignIn();

//   // ignore: unused_field
//   int _currentIndex = 0;
//   void onPageChanged(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   final List<Widget> _pages = [
//     const PageIndicators(),
//     const PageIndicators(),
//     const PageIndicators(),
//     const PageIndicators(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
   
//      // backgroundColor: AppColors.kWhite,
//       extendBody: true,
//       body: SafeArea(
//         child: Container(
//           decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(0),
//                 topRight: Radius.circular(0),
//                 bottomLeft: Radius.circular(0),
//                 bottomRight: Radius.circular(0),
//               ),
//               color: AppColors.kBlackedColor),
//           child: Padding(
//             padding: _currentIndex != 1
//                 ? const EdgeInsets.only(top: 25.0)
//                 : const EdgeInsets.only(top: 0),
//             child: PageView(
//               controller: pageController,
//               onPageChanged: onPageChanged,
//               physics: const NeverScrollableScrollPhysics(),
//               children: _pages,
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: DotNavigationBar(
     
      
//         //margin: const EdgeInsets.all(0),
//         //  margin: EdgeInsets.all(3000),
//         marginR: const EdgeInsets.all(8),
//         borderRadius: 0,
//         dotIndicatorColor: AppColors.iconColor.colors[1],
//         backgroundColor: AppColors.kScaffoldColor,
//         selectedItemColor: Colors.amber,
//         unselectedItemColor: Colors.grey,
//         paddingR: const EdgeInsets.only(bottom: 1, top: 1),
//         currentIndex: _currentIndex,
//         onTap: (int index) {
//           pageController.jumpToPage(index);
//         },
//         items: [
//           DotNavigationBarItem(
//               icon: const BottomIconWidget(
//             icon: Icons.speed,
//           )),
//           DotNavigationBarItem(
//               icon: const BottomIconWidget(
//             icon: Icons.feed,
//           )),
//           DotNavigationBarItem(
//               icon: const BottomIconWidget(
//             icon: Icons.trending_up_outlined,
//           )),
//           DotNavigationBarItem(
//               icon: const BottomIconWidget(
//             icon: Icons.calendar_today_rounded,
//           )),
//         ],
//       ),
//     );
//   }
// }

import 'package:design/constants/appcolors.dart';
import 'package:design/design/home/widgets/bottom_icon_widget.dart';
import 'package:design/design/indicators/page_indicators.dart';
import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pageController = PageController();
  final googleSignIn = GoogleSignIn();

  // ignore: unused_field
  int _currentIndex = 0;
  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = const [
    PageIndicators(),
    PageIndicators(),
    PageIndicators()
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
       
        body: Padding(
          padding: EdgeInsets.only(top: size.height * 0.021),
          child: Container(
            decoration:const BoxDecoration(
                borderRadius:  BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                color:  Colors.black),
            child: Padding(
              padding: _currentIndex != 1
                  ? const EdgeInsets.only(top: 25.0)
                  : const EdgeInsets.only(top: 0),
              child: PageView(
                controller: pageController,
                onPageChanged: onPageChanged,
                physics: const NeverScrollableScrollPhysics(),
                children: _pages,
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: AppColors.kScaffoldColor,
          child: DotNavigationBar(
            backgroundColor: AppColors.kScaffoldColor,
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.grey,
            paddingR: const EdgeInsets.only(bottom: 5, top: 5),
            currentIndex: _currentIndex,
            onTap: (int index) {
              pageController.jumpToPage(index);
            },
            items: [
              DotNavigationBarItem(
                icon: const BottomIconWidget(icon: Icons.speed)
              ),
               DotNavigationBarItem(
                icon: const BottomIconWidget(icon: Icons.feed)
              ),
                DotNavigationBarItem(
                icon: const BottomIconWidget(icon: Icons.trending_up_outlined)
              ),
               DotNavigationBarItem(
                icon: const BottomIconWidget(icon: Icons.calendar_month)
              ), 
            
            ],
          ),
        ),
      ),
    );
  }
}



