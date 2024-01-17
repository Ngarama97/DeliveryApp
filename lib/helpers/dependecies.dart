import 'package:delivery_app/data/api/api_client.dart';
import 'package:delivery_app/data/controllers/popular_product_controller.dart';
import 'package:delivery_app/data/repository/popular_product_repo.dart';
import 'package:delivery_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> init() async {
  debugPrint("Called");
  //apiClient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.APP_BASE_URL));
  //repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //Controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
