import 'package:flutter/material.dart';

class DetailKnowledgeToggle {
  String title;
  double currentValue;
  List<double> values;
  List<bool> selected;
  List<Widget> toggleChilderen;

  DetailKnowledgeToggle(this.title, this.currentValue, this.values,
      this.selected, this.toggleChilderen);
}
