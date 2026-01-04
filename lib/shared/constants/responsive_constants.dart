import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSizes {
  // Padding and margins
  static double paddingXS = 4.w;
  static double paddingS = 8.w;
  static double paddingM = 16.w;
  static double paddingL = 24.w;
  static double paddingXL = 32.w;
  static double paddingXXL = 48.w;

  // Spacing between widgets
  static double spacingXS = 4.h;
  static double spacingS = 8.h;
  static double spacingM = 16.h;
  static double spacingL = 24.h;
  static double spacingXL = 32.h;
  static double spacingXXL = 48.h;

  // Border radius
  static double radiusS = 4.r;
  static double radiusM = 8.r;
  static double radiusL = 12.r;
  static double radiusXL = 16.r;
  static double radiusXXL = 24.r;

  // Font sizes
  static double fontXS = 10.sp;
  static double fontS = 12.sp;
  static double fontM = 14.sp;
  static double fontL = 16.sp;
  static double fontXL = 18.sp;
  static double fontXXL = 20.sp;
  static double fontXXXL = 24.sp;
  static double fontXXXXL = 28.sp;
  static double fontXXXXXL = 32.sp;

  // Icon sizes
  static double iconS = 16.r;
  static double iconM = 20.r;
  static double iconL = 24.r;
  static double iconXL = 28.r;
  static double iconXXL = 32.r;

  // Button dimensions
  static double buttonHeightM = 48.h;
  static double buttonHeightL = 56.h;
  static double buttonHeightXL = 64.h;

  // Screen dimensions
  static double screenWidth = 1.sw;
  static double screenHeight = 1.sh;

  // Specific component sizes
  static double appBarHeight = 56.h;
  static double bottomNavHeight = 64.h;
  static double cardHeight = 120.h;
  static double avatarSizeS = 32.r;
  static double avatarSizeM = 48.r;
  static double avatarSizeL = 64.r;
  static double avatarSizeXL = 80.r;
}

class AppBreakpoints {
  static const double mobile = 480;
  static const double tablet = 768;
  static const double desktop = 1024;

  static bool isMobile(double width) => width < mobile;
  static bool isTablet(double width) => width >= mobile && width < desktop;
  static bool isDesktop(double width) => width >= desktop;
}
