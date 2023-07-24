import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showBottomTitleSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.black),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SelectableText(
              'NIFTY 50',
            ),
            Divider(
              color: Colors.white,
            ),
            _SelectableText(
              'NIFTY BANK',
            ),
            Divider(
              color: Colors.white,
            ),
            _SelectableText(
              'NIFTY FIN SERVICE',
            ),
            Divider(
              color: Colors.white,
            ),
            _SelectableText(
              'NIFTY I',
            ),
            Divider(
              color: Colors.white,
            ),
            _SelectableText(
              'NIFTY BANK FEATURE',
            ),
            Divider(
              color: Colors.white,
            ),
            _SelectableText(
              'NIFTY FIN SERVICE FEATURE',
            ),
            SizedBox(height: 16.0)
          ],
        ),
      );
    },
  );
}

class _SelectableText extends StatelessWidget {
  final String text;

  const _SelectableText(this.text);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Provider.of<SelectedTextProvider>(context, listen: false)
            .setSelectedText(text);
        Navigator.pop(context);
      },
      title: Text(
        text,
        style: const TextStyle(
          fontFamily: "Lora",
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

class SelectedTextProvider extends ChangeNotifier {
  String selectedText = "NIFTY 50";

  void setSelectedText(String selectedText) {
    this.selectedText = selectedText;
    debugPrint(this.selectedText);
    notifyListeners();
  }
}
