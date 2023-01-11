
import 'package:cost_cut/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData myTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    headline1: GoogleFonts.montserrat(
      color: kDarkBlack,
      fontSize: 28,
      fontWeight: FontWeight.w700,
    ),
    headline2: GoogleFonts.montserrat(
      color: kDarkBlack,
      fontSize: 30,
      fontWeight: FontWeight.normal,
    ),
    headline3: GoogleFonts.montserrat(
      color: kDarkBlack,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    
    bodyText2: GoogleFonts.montserrat(
      color: kDarkBlack,
      fontSize: 12,
    ),
    bodyText1: GoogleFonts.montserrat(
      color: kMediumBlack,
      fontSize: 14,
    ),
  ),
);
