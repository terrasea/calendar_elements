library calendar.elements.utilities;

import 'package:polymer/polymer.dart' show observable, Observable, toObservable,
                                           polymerCreated, ChangeNotifier;


abstract class Month {
  @observable String get name;
  @observable int get number;
  @observable int get year;
  @observable int get daysInMonth;
  @observable int get weekDay;

  @observable List<List<MonthCell>> get contents;

  const Month();

  factory Month.create(int number, int year) {
    return new MonthImpl(number, year);
  }
}


class MonthImpl extends Month with ChangeNotifier {
  int _number;
  int _year;
  DateTime _firstDayOfMonth;
  List<List<MonthCell>> _contents = toObservable([]);

  static final List<String> _monthNames = ["January", "February", "March", "April",
                                           "May", "June", "July", "August",
                                           "September", "October", "November",
                                           "Decmember"];

  static final List<int> _daysInMonthList = [31, 28, 31, 30, 31, 30,
                                             31, 31, 30, 31, 30, 31];

  @observable String get name => _monthNames[number-1];
  @observable int get number => _number;
  @observable int get year => _year;
  @observable int get daysInMonth => number == 2 && _isLeapYear() ? 29 : _daysInMonthList[number-1];
  @observable int get weekDay => _firstDayOfMonth.weekday;
  @observable List<List<MonthCell>> get contents => _contents;


  MonthImpl(this._number, this._year) {
    _firstDayOfMonth = new DateTime(year, number, 1);
    _createContents();
  }


  bool  _isLeapYear() {
    return ((year % 4 == 0) && (year % 100 != 0))
              || (year % 400 == 0);
  }


  void _createContents() {
    int day = 1;
    new List<MonthCell>();
    //do first row separately
    _contents.add(new List<MonthCell>.generate(7, (pos) {
      return pos >= weekDay ? new MonthCell.create(1, pos+1, new DateTime(year, number, day++)) :
        new MonthCell.create(1, pos+1);
    }));

    //now do th rest
    for(int row = 1; row < 6; row++) {
      _contents.add(new List<MonthCell>.generate(7, (pos) {
        return day <= daysInMonth ? new MonthCell.create(row+1, pos+1, new DateTime(year, number, day++)) :
          new MonthCell.create(row+1, pos+1);
      }));
    }

  }
}



abstract class MonthCell {
  int get row;
  int get column;
  String get contents;
  bool get isCurrentDay;

  const MonthCell();

  factory MonthCell.create(int row, int col, [DateTime date]) {
    return date != null ? new MonthCellImpl(row, col, date) : new EmptyMonthCell(row, col);
  }
}


class MonthCellImpl extends MonthCell with ChangeNotifier {
  int _row;
  int _column;
  DateTime _date;

  @observable int get row => _row;
  @observable int get column => _column;
  @observable String get contents => "${_date.day}";
  @observable bool get isCurrentDay {
    DateTime now = new DateTime.now();

    return _date.day == now.day && _date.month == now.month && _date.year == now.year;
  }


  MonthCellImpl(this._row, this._column, this._date);
}


class EmptyMonthCell extends MonthCell with ChangeNotifier {
  int _row;
  int _column;

  @observable int get row => _row;
  @observable int get column => _column;
  @observable String get contents => "";
  @observable bool get isCurrentDay => false;

  EmptyMonthCell(this._row, this._column);
}
