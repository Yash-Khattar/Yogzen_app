import 'package:flutter/material.dart';

class ChallengeProvider extends ChangeNotifier {
  final List<bool> isCompleted = List.filled(10, false);
  setCompleted(int index) {
    isCompleted[index] = true;
    notifyListeners();
  }

  get getCompleted => isCompleted;
}
