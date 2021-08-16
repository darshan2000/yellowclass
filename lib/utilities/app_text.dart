import 'package:yellow_class/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {
  static Widget Blog(
      {@required text,
        color,
        textAlign,
        textOverflow,
        size,
        decoration,
        fontStyle,
        fontWeight,
        decorationColor,
        max}) {
    TextStyle textStyle = GoogleFonts.lato(
      fontSize: size,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontStyle: fontStyle ?? FontStyle.normal,
      color: color,
      decoration: decoration ?? TextDecoration.none,
      decorationColor: decorationColor ?? ThemeColors.whiteColor,
      height: 1.5,
    );
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: max,
    );
  }
  static Widget Heading(
      {@required text, color, textAlign, textOverflow, size}) {
    TextStyle textStyle = GoogleFonts.raleway(
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: color,
    );
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }

  static Widget SubHeading(
      {@required text,
      color,
      textAlign,
      textOverflow,
      size,
      fontStyle,
      fontWeight}) {
    TextStyle textStyle = GoogleFonts.raleway(
      fontSize: size,
      fontWeight: fontWeight ?? FontWeight.w600,
      fontStyle: fontStyle ?? FontStyle.normal,
      color: color,
    );
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }

  static Widget SubHeadingS(
      {@required text,
      color,
      textAlign,
      textOverflow,
      size,
      decoration,
      fontStyle}) {
    TextStyle textStyle = GoogleFonts.raleway(
        fontSize: size,
        //letterSpacing: 3.5,
        fontWeight: FontWeight.w500,
        fontStyle: fontStyle ?? FontStyle.normal,
        color: color ?? ThemeColors.blackColor,
        decoration: TextDecoration.none ?? decoration);
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }

  static Widget Content(
      {@required text,
      color,
      textAlign,
      textOverflow,
      size,
      decoration,
      fontStyle,
      fontWeight,
        maxLines,
      decorationColor}) {
    TextStyle textStyle = GoogleFonts.openSans(
      fontSize: size,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontStyle: fontStyle ?? FontStyle.normal,
      color: color,
      decoration: decoration ?? TextDecoration.none,
      decorationColor: decorationColor ?? ThemeColors.whiteColor,
      height: 1.5,
    );
    return Text(
      text,
      maxLines: maxLines,
      style: textStyle,
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }

  static Widget SubContent(
      {@required text,
      color = Colors.blueGrey,
      textAlign,
      textOverflow,
      size,
      fontStyle,
      style}) {
    TextStyle textStyle = GoogleFonts.openSans(
      textStyle: style,
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: color,
      fontStyle: fontStyle ?? FontStyle.normal,
    );
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }

  static Widget ContentB(
      {@required text, color, textAlign, textOverflow, size}) {
    TextStyle textStyle = GoogleFonts.openSans(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: color ?? ThemeColors.blackColor,
    );
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }


}
