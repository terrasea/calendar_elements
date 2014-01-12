library calendar.elements.month.cell;

import 'package:polymer/polymer.dart';
import 'month_utilities.dart';

import 'dart:html';

@CustomTag('month-cell')
class MonthCellElement extends DivElement with Polymer, Observable {
  @published MonthCell cell;

  MonthCellElement.created() : super.created() {
    polymerCreated();

  }

  @override
  void enteredView() {
    super.enteredView();

    if(cell.isCurrentDay) {
      style.backgroundColor = "lightgrey";
    }

  }
}