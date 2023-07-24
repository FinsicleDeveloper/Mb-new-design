
import 'package:flutter/material.dart';

class TimeChanger extends ChangeNotifier {
  String time = '1m';
  String dateTime = 'Loading...';
  int docIndex = 0;
  double initialSliderValue = 0;
  double initialPoint = 0;
  int doclenth = 0;
  int maX = 0;

  void timeChanger({required String currentTime}) {
    time = currentTime;

    notifyListeners();
  }

  void dateTimeChanger({required String dateTime}) {
    this.dateTime = dateTime;
  }

  void changeDocIndex(int value) {
    docIndex = value;
    notifyListeners();
  }

  void sliderValue(double value) {
    initialSliderValue = value;
    notifyListeners();
  }

  void setDocIndex0() {
    docIndex = 0;
    initialPoint = 0;
    notifyListeners();
  }

  void changeInitialPoint(double value) {
    initialPoint = value;
  }
}

class CollectionNameProvider extends ChangeNotifier {
  String time = '1m';

  void changeCollectionName({required String currentTime}) {
    time = currentTime;
    
    notifyListeners();
  }
}