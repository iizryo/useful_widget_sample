import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = ChangeNotifierProvider(
  (ref) => HomeController(),
);

class HomeController extends ChangeNotifier {
  HomeController();
  int currentIndex = 0;

  void onTabTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void resetCurrentIndex() {
    currentIndex = 0;
    notifyListeners();
  }
}
