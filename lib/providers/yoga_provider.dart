import 'package:flutter/material.dart';
import 'package:yogzen/models/yoga.dart';

class YogaProvider extends ChangeNotifier {
  List<Yoga> yogaData = [];
  List<Yoga> get getYogaData => yogaData;
  void setYogaData(List<Yoga> yogaData) {
    this.yogaData = yogaData;
    notifyListeners();
  }
}
