import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/app_icon.dart';
import 'package:delivery_app/widgets/big_text.dart';
import 'package:flutter/material.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
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
                padding: EdgeInsets.only(
                    top: Layout.height10, bottom: Layout.height10),
                width: double.maxFinite,
                color: Colors.white,
                child: Center(child: BigText(text: 'Big Cheese')),
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
              margin: EdgeInsets.symmetric(horizontal: Layout.width15),
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse id iaculis mauris. Nulla sed nisi metus. Nulla non lorem at justo semper tincidunt. Quisque eu gravida magna. Cras porttitor, mi cursus euismod lobortis, lacus nunc vestibulum quam, auctor aliquam ante nunc vel mi. Maecenas iaculis blandit lectus id viverra. Aliquam erat volutpat. Proin posuere id urna eu tristique.Nulla vel purus vel eros pharetra tristique. Phasellus urna dui, laoreet in neque eget, rutrum interdum nulla. Vivamus ultrices augue non nisl congue, ut eleifend libero pretium. Ut pretium mauris orci, in convallis enim ultrices ut. Sed gravida ex et dolor varius venenatis. Pellentesque a eros eget enim gravida elementum. Aliquam cursus, nibh in euismod ornare, quam arcu tristique augue, eu posuere eros nisi posuere orci.Sed sit amet tempor dui, et interdum quam. Nam malesuada magna turpis, et egestas sem aliquam eu. Sed volutpat ipsum at lectus ultrices, et vehicula libero rhoncus. In vestibulum sapien et elit dignissim, eget ornare enim aliquet. Pellentesque cursus semper placerat. Nam gravida at ligula nec sollicitudin. Maecenas volutpat felis a neque finibus malesuada. Donec suscipit, ipsum id laoreet placerat, justo orci aliquam diam, semper maximus lorem est id augue. Nam ac erat erat. Aenean pretium eu lectus vitae commodo. Curabitur tortor ipsum, tincidunt non sem ut, ullamcorper luctus eros. Sed condimentum libero quis arcu vestibulum mattis. Nam sed est ac nisl posuere iaculis. Pellentesque vel ligula ultrices, venenatis magna et, egestas orci. Sed tellus elit, tristique eget sem eu, aliquet scelerisque turpis.Fusce ultrices odio eu elit sodales, a feugiat justo convallis. Nunc iaculis interdum risus. Proin sodales nisi vel arcu pharetra, quis efficitur sem bibendum. Quisque sagittis convallis tincidunt. Integer molestie porttitor ipsum ac dictum. Nunc viverra nec dui vitae faucibus. Donec sit amet pulvinar sem. Sed malesuada, turpis eu suscipit sollicitudin, dui quam consectetur mauris, sit amet pretium leo enim non elit. Vivamus tempor, risus vel rutrum semper, lorem diam suscipit lectus, a iaculis nulla nisi vitae quam. Integer venenatis malesuada viverra. Etiam lobortis metus nec mollis auctor. Cras mattis placerat felis, quis congue augue cursus ac.Proin ornare mi vitae dui faucibus tempor. Suspendisse varius metus libero, non dignissim elit egestas eget. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque quis sem congue, mollis leo quis, elementum augue. Donec id tellus libero. Nam viverra vestibulum iaculis. Phasellus fringilla neque eu quam aliquam, in porttitor leo ultrices. Nunc ut quam sit amet ipsum vestibulum dignissim. Aenean pretium augue vitae blandit commodo. Aliquam blandit purus eget tincidunt condimentum. Vivamus accumsan elit eu mollis cursus. Sed dapibus porta vehicula. Phasellus ligula nibh, consequat sit amet sodales vel, lobortis sit amet est.'),
            ),
          )
        ],
      ),
    );
  }
}
