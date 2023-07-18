import 'package:flutter/material.dart';

class ChangerProvider extends ChangeNotifier {
  String mins = '1 mins';
  setmins(String value) {
    mins = value;
    print(mins);
    notifyListeners();
  }
}
