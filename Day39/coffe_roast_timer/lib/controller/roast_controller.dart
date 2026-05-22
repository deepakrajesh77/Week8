import 'dart:async';
import 'package:flutter/material.dart';
import '../model/roast_model.dart';

class RoastController extends ChangeNotifier {
  final RoastModel model = RoastModel();

  Timer? timer;

  void startRoasting() {
    timer?.cancel();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (t) {
        if (model.seconds >= 50) {
          t.cancel();
        } else {
          model.seconds++;
          notifyListeners();
        }
      },
    );
  }

  void forward() {
    if (model.seconds < 50) {
      model.seconds += 10;
      notifyListeners();
    }
  }

  void back() {
    if (model.seconds > 0) {
      model.seconds -= 10;
      notifyListeners();
    }
  }

  void reset() {
    timer?.cancel();
    model.seconds = 0;
    notifyListeners();
  }
}