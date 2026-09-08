
// constants.dart — Central place for theme colors and static text
// - Constants.primaryColor, blackColor: used across widgets for consistent
//   styling. Also holds onboarding strings used by the splash/onboarding screens.

import 'package:flutter/material.dart';

class Constants {
  /// Primary brand green used for accents, buttons, and highlights.
  static Color primaryColor = const Color(0xFF296E48);

  /// Secondary text and icon color with reduced emphasis.
  static Color blackColor = Colors.black54;

  // --- Onboarding slide copy (Persian) ---

  /// Title for the first onboarding page.
  static String titleOne = 'گیاهان را بهتر از قبل درک کن';

  /// Description for the first onboarding page.
  static String descriptionOne = 'در مورد نگه داری گل و گیاهان میتوانی اطلاعات کسب کنی';

  /// Title for the second onboarding page.
  static String titleTwo = 'با گیاهان جدید آشنا شو';

  /// Description for the second onboarding page.
  static String descriptionTwo = 'رز مشکی یا گل رز دوست داری؟ اینجا میتونی پیداش کنی';

  /// Title for the third onboarding page.
  static String titleThree = 'با یک گل بهار نمیشود، گل بکار';

  /// Description for the third onboarding page.
  static String descriptionThree = 'هر گلی نیاز داشته باشید در این اپلیکیشن پیدا میکنید';
}
