import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateConverter{

 static String convert(int timeStamp){
   return DateFormat(DateFormat.ABBR_MONTH_DAY).format(DateTime.fromMillisecondsSinceEpoch(timeStamp));
 }
}