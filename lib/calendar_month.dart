library calendar.elements.month;

import 'package:polymer/polymer.dart';
import 'month_utilities.dart';


@CustomTag('calendar-month')
class MonthCalendar extends PolymerElement {
  @observable Map<String, String> month_grid = toObservable({});

  @published int month;
  @published int year;

  @observable Month monthView;

  MonthCalendar.created() : super.created() {
    changes.where((val) {
      print("${val}");

      return false;
    }).listen((data) => print("${data}"));
      /*.then((val) {
      print("val is ${val}");
      changes.listen((change) {
        print("${change}");
        change.forEach((el) {
          print("${el.name}");
          print("${el.name}".contains("month") ? "month" : "not month");
        });
      }, onError: (e) => print("${e}"), onDone: () => print("done"), cancelOnError: false);
    });*/
  }

  @override
  void enteredView() {
    super.enteredView();

    if(month == null || month > 12 || month < 1) {
      month = new DateTime.now().month;
    }


    if(year == null || year < 1) {
      year = new DateTime.now().year;
    }

    monthView = new Month.create(month, year);
  }
}
