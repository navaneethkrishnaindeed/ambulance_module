
// ignore: camel_case_types
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class DS_Style_QuickSand{

 static TextStyle params({
  Color? textColor,
  FontWeight? fontWeight,
  double? fontSize,
  double? height,
  double? letterSpacing
 }){
       return GoogleFonts.quicksand(
        color: textColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
        height: height,
        letterSpacing: letterSpacing,
        // decoration: TextDe
        
       );
 }

}