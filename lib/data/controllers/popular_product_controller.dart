import 'package:delivery_app/data/repository/popular_product_repo.dart';
import 'package:delivery_app/models/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({
    required this.popularProductRepo,
  });

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    debugPrint("meee");
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);

      update();
    } else {}
  }
}
