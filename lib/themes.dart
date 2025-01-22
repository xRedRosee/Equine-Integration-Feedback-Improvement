import 'package:flutter/material.dart';

// Texts
final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: gray,
    textTheme: TextTheme(
  // Title of the page
  displayMedium: TextStyle(fontSize: 48.0, fontWeight: FontWeight.w600),

  // Warning title
  headlineMedium: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),

  // Title sections and warning text
  titleLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),

  // Title of of the text inside box
  titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),

  // Recording alert title
  labelLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),

  // Text inside input field
  labelSmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),

  // Text inside box
  bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),

  // calendar box
  titleSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: darkGray40, height: 1),
  bodySmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)
));

// Colors
final Color red = Color(0xFFE50000);
final Color lightBlue = Color(0xFFE5EAEF);
final Color thunderBlue = Color(0xFF001B2F);
final Color brightBlue = Color(0xFF2BE6DF);
final Color brightGreen = Color(0xFF83E800);
final Color darkGreen = Color(0xFF539500);
final Color gray = Color(0xFFF8F4F3);
final Color orange = Color(0xFFFF9900);
final Color purple = Color(0xFF6700EB);
final Color pink = Color(0xFFFF00C7);
final Color black = Color(0xFF000000);
final Color darkGray = Color(0xFF868A8B);
final Color darkGray40 = Color.fromARGB(99, 134, 138, 139);
final Color yellow = Color(0xFFE9E200);
final Color white = Color(0xFFFFFFFF);
final Color recordingAlertGreen = Color(0xFF4BC850);
final Color recordingAlertRed = Color(0xFFFF3535);
final Color fullBlue = Color(0xFF0066EB);

// Border radius
final BorderRadius borderRadius = BorderRadius.circular(26);

// Padding between sections
final paddingBetweenSecions = EdgeInsets.fromLTRB(0, 0, 0, 44);

// Padding between blocks inside section
final paddingBetweenBlocks = EdgeInsets.fromLTRB(0, 0, 0, 18);

// Padding inside block
final paddingInBlock = EdgeInsets.fromLTRB(18, 32, 18, 32);

// Padding inside recording Alert
final paddingInRecordingAlert = EdgeInsets.fromLTRB(18, 16, 18, 16);

final defaultBoxShadow = [
  BoxShadow(
    color: black.withOpacity(0.1),
    spreadRadius: 1,
    blurRadius: 5,
    offset: const Offset(0, 2),
  ),
];
