import 'package:get/get.dart';

class Layout {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 6.49;

  //dynamic height, padding and margin
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height45 = screenHeight / 18.76;
  static double height30 = screenHeight / 28.13;

  //dynamic width, padding and margin
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
  static double width40 = screenHeight / 24.2;
  static double width45 = screenHeight / 18.76;

  static double font20 = screenHeight / 42.2;

  //radius
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;
  static double radius15 = screenHeight / 56.27;

  //iconSize
  static double iconSize = screenHeight / 25.17;
}
