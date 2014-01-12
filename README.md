Calendar Elements
=================

Create some Polymer Dart calendar elements

 + Year
 + Month
 + Day

This project is very much a fun Project designed to be both useful, and another way to learn Dart and Polymer Dart.

So far I've just created a <calendar-month> Element.

Attributes

 + month - a int representing the month in the year from 1 to 12. Defaults to current month.
 + year - also an int ie 2014, defaults to current year

To use this element you must import it into the html

&lt;link rel="import" href="packages/calendar\_elements/calendar-month.html"&gt;

Then use it in the page

&lt;calendar-month month="2" year="2014"&gt;

which will show February 2014

There are no next of previous buttons, those will come later, and not necessarily as part of the calendar-month element.  I'll see what both my mood at the time and tech constrants allow me to do.

