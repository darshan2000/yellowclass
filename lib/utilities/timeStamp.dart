import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateConverter{

 static String convert(int timeStamp){
   return DateFormat(DateFormat.HOUR_MINUTE).format(DateTime.fromMillisecondsSinceEpoch(timeStamp));
 }
}