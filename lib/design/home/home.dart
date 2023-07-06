

import 'package:design/constants/appcolors.dart';
import 'package:design/design/home/widgets/bottom_icon_widget.dart';
import 'package:design/design/indicators/page2.dart';
import 'package:design/design/indicators/page3.dart';
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

    PAGE2(),
    Page3()
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      
      child: Scaffold(
        backgroundColor: AppColors.kBlackedColor,
       extendBody: true,
        body: Padding(
          padding: EdgeInsets.only(top: size.height * 0.01),
          child: Container(
            decoration:  BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                color: _currentIndex == 0 ?Colors.grey[900]:  const Color(0xff263016),),
            child: Padding(
              padding: _currentIndex != 1
                  ? const EdgeInsets.only(top: 25.0)
                  : const EdgeInsets.only(top: 25.0),
              child: PageView(
                controller: pageController,
                onPageChanged: onPageChanged,
                physics: const NeverScrollableScrollPhysics(),
                children: _pages,
              ),
            ),
          ),
        ),
        bottomNavigationBar: DotNavigationBar(
          backgroundColor: AppColors.kBlackedColor,
          selectedItemColor: AppColors.kWhite,
          unselectedItemColor: Colors.grey,
          paddingR: const EdgeInsets.only(bottom: 5, top: 5),
          currentIndex: _currentIndex,
          onTap: (int index) {
            pageController.jumpToPage(index);
          },
          items: [
            DotNavigationBarItem(
              
              icon: const  Icon(Icons.speed,)       
            ),
             DotNavigationBarItem(
             
              icon: const Icon( Icons.feed)
            ),
              DotNavigationBarItem(
              icon: const Icon( Icons.trending_up_outlined)
            ),
             DotNavigationBarItem(
              icon: const Icon( Icons.calendar_month)
            ), 
          
          ],
        ),
      ),
    );
  }
}



