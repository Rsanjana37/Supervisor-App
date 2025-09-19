import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextThemes {
  static TextTheme get lightTextTheme => const TextTheme(
    // Display styles (largest text)
    displayLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimaryColor,
    ),

    displayMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimaryColor,
    ),

    // Headline styles (for headings)
    headlineLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimaryColor,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimaryColor,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondaryColor,
    ),

    // Body styles (for normal text)
    bodyLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimaryColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimaryColor,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimaryColor,
    ),

    // Label styles (for buttons, etc)
    labelLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),

    //DialogBox Styles
    titleLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimaryColor,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimaryColor,
    ),
  );

  static TextStyle buttonFilledTheme(BuildContext context, {double? fontSize}) {
    final screenWidth = MediaQuery.of(context).size.width;
    return TextStyle(
      fontFamily: "Montserrat",
      color: Colors.white,
      fontSize: fontSize ?? screenWidth * 0.04,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle buttonNotFilledTheme(
    BuildContext context, {
    double? fontSize,
    Color? textColor,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    return TextStyle(
      fontFamily: "Montserrat",
      color: textColor ?? AppColors.textPlaceholderColor,
      fontSize: fontSize ?? screenWidth * 0.04,
      fontWeight: FontWeight.w500,
    );
  }

  static const TextStyle detailTextStyle = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary2Color,
  );

  static const TextStyle cancelButtonStyle = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 19.5 / 20,
    color: Color(0xFFFB7175),
  );

  //for home screen custom style
  static TextStyle exploreRentalsHeading(
    BuildContext context, {
    double? fontSize,
  }) {
    return TextStyle(
      fontFamily: "Montserrat",
      color: Colors.black,
      fontSize: 27,
      fontWeight: FontWeight.w400,
    );
  }

  static const TextStyle kycPageTopText = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryColor,
  );
  static const TextStyle kycPageSecondText = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 16,
    color: AppColors.textSecondary2Color,
  );
  //for kyc listing page
  static const TextStyle userTypeTitleStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.0,
    letterSpacing: 0,
    color: Color(0xCC000000),
  );
  // For Lister tutorial page blur page
  static const TextStyle tutorialHintTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 1.3,
    letterSpacing: 0,
    decoration: TextDecoration.none,
  );

  //custom for crowdsource
  static const TextStyle splashConnectTextColor = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: AppColors.splashIntroText,
  );
  static const TextStyle splashContainerTextColor = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: AppColors.lightYellowColor,
  );
  static const TextStyle reportWidgetTitleText = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimaryColor,
  );
}
