import 'package:flutter/material.dart';

class Sum with ChangeNotifier {
  double _sum;

  Sum(this._sum);

  double getSum() => _sum;

  void setSum(double sum) {
    _sum += sum;
    notifyListeners();
  }

  void undoSum(double sum) {
    _sum -= sum;
    notifyListeners();
  }

  void reset() {
    _sum = 0;
    notifyListeners();
  }
}
