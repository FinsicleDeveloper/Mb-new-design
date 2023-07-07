import 'package:flutter/foundation.dart';

class LoadingState with ChangeNotifier {
  bool _isLoading = true;
  bool showSplash = false;
  bool get isLoading => _isLoading;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void changeSplash(bool value) {
    showSplash = value;
    notifyListeners();
  }
}
