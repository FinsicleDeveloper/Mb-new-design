import 'package:design/constants/appcolors.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return

   Container(
          decoration: const BoxDecoration(
              color: AppColors.kbgGreen,
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  colors: [AppColors.kbgGreen, Colors.black38],
                  stops: [0, 1])),
    
       child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(30)
                ,color: const Color(0XFF585F4F),
                ),
                child: const SizedBox(
                  height:500,
                  width: 500,
                ),
              ),
            )
          ],
        ),
       ),
       );
 
    
  }
}
