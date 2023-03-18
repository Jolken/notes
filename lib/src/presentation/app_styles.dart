import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/src/presentation/app_colors.dart';

class AppStyles {
  static final smallTextStyle = GoogleFonts.acme(
    color: AppColors.darkBrown,
    fontSize: 16,
  );

  static final bigBoldTextStyle = GoogleFonts.acme(
    color: AppColors.darkBrown,
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  static final middleBolderTextStyle = GoogleFonts.rocknRollOne(
    fontSize: 16,
    fontWeight: FontWeight.w200,
  );
}
