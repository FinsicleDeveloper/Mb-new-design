import 'package:flutter/material.dart';






class TitleWidget extends StatefulWidget {
   const TitleWidget({
    super.key,
  });

  @override
  State<TitleWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
 final String _selectedItem = "Item 1";
  final List<String> _items = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white54, // Specify the border color here
          width: 2, // Specify the border width if needed
        ),
      ),
      child:const  SizedBox(
        height: 45,
        width: 210,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              "NIFTY 50",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 2),
            ), 
            
          // IconButton(onPressed: (){
          //   showDropdown();
          // }, icon: const Icon(Icons.arrow_drop_down, color: Colors.white,))
            // DropButton(items: items, selectedValue: selectedValue),
          ],
        )),
      ),
    );
  }

 void showDropdown() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: DropdownButton<String>(
            value: _selectedItem,
            items: _items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (V) {
              
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }


}