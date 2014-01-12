import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart';
import 'dart:html';
import 'dart:async';
import 'package:polymer/polymer.dart';

main() {
  // Ensure Polymer is looking for bound variables...
  addXParent();
  initPolymer();
  removeXParent();

  setUp(addXParent);
  tearDown(removeXParent);

  group("Calendar display", (){
    test('Exists', (){
      new Timer(
        new Duration(milliseconds: 2500),
        expectAsync0((){
          expect(
            querySelector('calendar-month').shadowRoot,
            isNotNull
          );
        })
      );
    });

    test('current', () {
      new Timer(
          new Duration(milliseconds: 2500),
          expectAsync0((){
            expect(
              querySelector('#current').shadowRoot,
              isNotNull
            );
          })
      );
    });

    test('current year 5th month', () {
      new Timer(
          new Duration(milliseconds: 2500),
          expectAsync0((){
            expect(
              querySelector('#currentyear5thmonth').shadowRoot,
              isNotNull
            );
          })
      );
    });

    test('feb leapyear 2016', () {
      new Timer(
          new Duration(milliseconds: 2500),
          expectAsync0((){
            expect(
              querySelector('#febleapyear2016').shadowRoot,
              isNotNull
            );
          })
      );
    });


    test('december 2013', () {
      new Timer(
          new Duration(milliseconds: 2500),
          expectAsync0((){
            expect(
              querySelector('#dec2013').shadowRoot,
              isNotNull
            );
          })
      );
    });
  });

}

addXParent() {
  document.body.append(createElement('<calendar-month id="current"></calendar-month>'));
  document.body.append(createElement('<calendar-month id="currentyear5thmonth" month="5"></calendar-month>'));
  document.body.append(createElement('<calendar-month id="febleapyear2016" month="2" year="2016"></calendar-month>'));
  document.body.append(createElement('<calendar-month id="dec2013" month="12" year="2013"></calendar-month>'));
}

removeXParent() {
  querySelectorAll('calendar-month').forEach((el)=> el.remove());
}

createElement(String html) =>
  new Element.html(html, treeSanitizer: new NullTreeSanitizer());

class NullTreeSanitizer implements NodeTreeSanitizer {
  void sanitizeTree(node) {}
}