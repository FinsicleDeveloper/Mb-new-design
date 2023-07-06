import 'package:design/constants/appcolors.dart';
import 'package:design/design/indicators/widgets/guage.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 172, 241, 60),
              ),
              child: Center(
                child:  Text(
                  "1 minute",
                
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    
                  ),
                ),
              ),
            ),

// FloatingActionButton(
//   backgroundColor: Colors.white60,
//   onPressed: (){}, child: CircleAvatar(
//     radius: 23 ,
//     backgroundColor: AppColors.kWhite,
//     child: Text("1 M"),
//   ),),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.kbgGreen,
                  // gradient: const LinearGradient(
                  //   end: Alignment.bottomCenter,
                  //   begin: Alignment.topCenter,
                  //   colors: [AppColors.kbgGreen, Colors.white10],
                  // ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                      child: Row(
                        children: [
                          Expanded(child: Guage(needleValue: 10)),
                          Expanded(
                              child: Guage(
                            needleValue: 10,
                            isOsillator: true,
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
