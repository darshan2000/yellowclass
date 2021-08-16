

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeColors{

  static List<Color> pieColors = [Color(0xffE54A5F),Color(0xff3654A3),Color(0xffFFA36C),Color(0xff8559A5)];

  static List<LinearGradient> gradients = [
/*    LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.3,1],
        colors: [Color(0xFFff9966), Color(0xFFff5e62)]),*/
    LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.3,1],
        colors: [Color(0xFF7F00FF), Color(0xFFE100FF)]),
    LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.4,0.8],
        colors: [Color(0xFF06beb6), Color(0xFF48b1bf)]),
    LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.4,0.8],
        colors: [Color(0xFFe52d27), Color(0xFFb31217)]),
    LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.3,1],
        colors: [Color(0xFF396afc), Color(0xFF2948ff)]),
    LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.3,1],
        colors: [Color(0xFFff7e5f), Color(0xFFfeb47b)]),
    LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.3,1],
        colors: [Color(0xFF8E2DE2), Color(0xFF3F5EFB)]),
    LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.3,1],
        colors: [Color(0xFFbc4e9c), Color(0xFFf80759)]),
    LinearGradient (
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.3,1],
        colors: [Color(0xFFff5f6d), Color(0xFFffc371)]),
    LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.3,1],
        colors: [Color(0xFF00c6ff), Color(0xFF0072ff)]),
    LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.3,1],
        colors: [Color(0xFF0575e6), Color(0xFF021b79)]),
  ];

  static Color highlightColor = Color(0xFF1ed760);
  static Color secondaryColor = Color(0xFF1c1c1c);
  static Color subSecondaryColor = Colors.blueGrey;
  static Color blackColor = Color(0xFF1c1c1c);
  static Color whiteColor = Color(0xFFfcfcfc);
  static Color darkWhite = Color(0xFFf7f5f5);
  static Color lightGrey = Color(0xFFf3eeee);
  static Color red = Color(0xffE54A5F);
  static Color blue = Color(0xff3654A3);
  static Color orange = Color(0xffFFA36C);
  static Color violet = Color(0xff8559A5);

  static LinearGradient getRandomGradient(){
    const _chars = '1234567890';
    Random _rnd = Random();
    var index = int.parse( String.fromCharCodes(Iterable.generate(
        1, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)))));
    return gradients[index];
  }

}