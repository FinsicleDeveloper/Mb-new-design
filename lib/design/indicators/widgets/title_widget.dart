import 'package:design/design/indicators/functions/bootom_sheet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';






class TitleWidget extends StatelessWidget {
   const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showBottomTitleSheet(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.white54, // Specify the border color here
            width: 2, // Specify the border width if needed
          ),
        ),
        child:  SizedBox(
          height: 45,
          width: 210,
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                Provider.of<SelectedTextProvider>(context).selectedText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 2),
              ), 
              
      
            ],
          )),
        ),
      ),
    );
  }


}