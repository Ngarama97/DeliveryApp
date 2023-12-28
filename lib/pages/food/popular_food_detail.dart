import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/app_colum.dart';
import 'package:delivery_app/widgets/app_icon.dart';
import 'package:delivery_app/widgets/big_text.dart';
import 'package:delivery_app/widgets/icon_text.dart';
import 'package:delivery_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //The image section, Background Image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Layout.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/food5.jpeg"),
                ),
              ),
            ),
          ),
          //The icons of the App BAr
          Positioned(
            left: Layout.width20,
            top: Layout.height40,
            right: Layout.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  size: 30,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_checkout_outlined,
                  size: 30,
                ),
              ],
            ),
          ),

          // Food Introduction
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Layout.popularFoodImgSize - Layout.height30,
            child: Container(
              padding: EdgeInsets.only(
                left: Layout.width20,
                top: Layout.height20,
                right: Layout.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Layout.radius20),
                  topLeft: Radius.circular(Layout.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppColumn(
                    text: "Chinese Side",
                  ),
                  SizedBox(
                    height: Layout.height20,
                  ),
                  BigText(text: "Introduce"),
                  SizedBox(
                    height: Layout.height20,
                  ),
                  // Expandable text Widget
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: Layout.width20,
          top: Layout.height20,
          bottom: Layout.height20,
          right: Layout.width20,
        ),
        height: Layout.bottomHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Layout.radius20 * 2),
            topRight: Radius.circular(Layout.radius20 * 2),
          ),
          color: Styles.buttonBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Add & Remove cart
            Container(
              padding: EdgeInsets.only(
                top: Layout.height10,
                left: Layout.width20,
                right: Layout.width20,
                bottom: Layout.height10,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Layout.radius15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Subtract Icon
                  Icon(
                    Icons.remove,
                    size: Layout.iconSize24,
                    color: Styles.paraColor,
                  ),
                  SizedBox(
                    width: Layout.width10 / 2,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Layout.width10 / 2,
                  ),
                  Icon(
                    Icons.add,
                    size: Layout.iconSize24,
                    color: Styles.paraColor,
                  )
                ],
              ),
            ),

            //Add to cart button
            Container(
              padding: EdgeInsets.only(
                top: Layout.height10,
                left: Layout.width20,
                right: Layout.width20,
                bottom: Layout.height10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Layout.radius15),
                color: Styles.mainColor,
              ),
              child: BigText(
                text: "\$10 | Add to Cart",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
