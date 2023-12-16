import 'package:delivery_app/home/food_page.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/widgets/big_text.dart';
import 'package:delivery_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //The headerSection
          Container(
            margin: EdgeInsets.only(top: 45, bottom: 15),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: "Tanzania",
                      color: Styles.mainColor,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: 'Dar es salaam',
                          color: Colors.black54,
                        ),
                        Icon(Icons.expand_more),
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Styles.mainColor,
                        borderRadius: BorderRadius.circular(6)),
                    child: Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          //The PageView Section
          const FoodPageBody(),
        ],
      ),
    );
  }
}
