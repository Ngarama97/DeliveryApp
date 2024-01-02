import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/app_icon.dart';
import 'package:delivery_app/widgets/big_text.dart';
import 'package:delivery_app/widgets/expandable_text.dart';
import 'package:flutter/material.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          //* The App Bar Section
          //Comprises of the sliver icon sectio
          //The background Image
          //The background Color
          //Toolbar height and the header in the bottom section */
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppIcon(
                  icon: Icons.close,
                ),
                const AppIcon(
                  icon: Icons.shopping_cart,
                ),
              ],
            ),

            toolbarHeight: 70,
            // The heading that gets pinned upon screen collapse
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Layout.radius20),
                      topRight: Radius.circular(Layout.radius20),
                    )),
                padding: EdgeInsets.only(
                    top: Layout.height10, bottom: Layout.height10),
                width: double.maxFinite,
                child: Center(
                    child: BigText(
                  text: 'Big Cheese',
                  size: Layout.font26,
                )),
              ),
            ),
            //pin the appbar
            pinned: true,
            backgroundColor: Styles.mainColor,
            expandedHeight: 300,

            //the collapsable section
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                fit: BoxFit.cover,
                width: double.maxFinite,
                'assets/images/food4.jpeg',
              ),
            ),
          ),

          //the scrollable section
          SliverToBoxAdapter(
            child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Layout.width15, vertical: Layout.height15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Long recommended food description
                    Container(
                      child: ExpandableText(
                          text:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse id iaculis mauris. Nulla sed nisi metus. Nulla non lorem at justo semper tincidunt. Quisque eu gravida magna. Cras porttitor, mi cursus euismod lobortis, lacus nunc vestibulum quam, auctor aliquam ante nunc vel mi. Maecenas iaculis blandit lectus id viverra. Aliquam erat volutpat. Proin posuere id urna eu tristique.Nulla vel purus vel eros pharetra tristique. Phasellus urna dui, laoreet in neque eget, rutrum interdum nulla. Vivamus ultrices augue non nisl congue, ut eleifend libero pretium. Ut pretium mauris orci, in convallis enim ultrices ut. Sed gravida ex et dolor varius venenatis. Pellentesque a eros eget enim gravida elementum. Aliquam cursus, nibh in euismod ornare, quam arcu tristique augue, eu posuere eros nisi posuere orci."),
                    ),

                    // Adding and removing products in cart
                  ],
                )),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        // Adding and removing products section
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: Layout.width45 * 2),
            padding: EdgeInsets.symmetric(vertical: Layout.height10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(Layout.radius20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.do_not_disturb_on_rounded,
                  color: Styles.mainColor,
                  size: Layout.iconSize24,
                ),
                BigText(
                  text: '\$12.88 X 0',
                  color: Styles.mainBlackColor,
                  size: Layout.font26,
                ),
                Icon(
                  Icons.add_circle,
                  size: Layout.iconSize24,
                  color: Styles.mainColor,
                ),
              ],
            ),
          ),

          //The Add to cart and favorite Bottom Navigation Container
          Container(
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
                    child: Icon(
                      Icons.favorite,
                      color: Styles.mainColor,
                      size: Layout.iconSize24,
                    )),

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
        ],
      ),
    );
  }
}
