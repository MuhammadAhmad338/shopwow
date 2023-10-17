// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  bool _isFavourite = false;
  bool get isFavourite => _isFavourite;

  void changeFavourite() {
    _isFavourite = !_isFavourite;
    notifyListeners();
  }
}
