import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/widgets/big_text.dart';
import 'package:delivery_app/widgets/icon_text.dart';
import 'package:delivery_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var _currentPagValue = 0.0;
  var _scaleFactor = 0.8;
  var _height = 220;

  //Function for listening to page value
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPagValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //scolor: Colors.grey,
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    //Checking the page view and making the transformation
    Matrix4 matrix = new Matrix4.identity();

    // Condition for the current page
    if (index == _currentPagValue.floor()) {
      var currScale = 1 - (_currentPagValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    }
    // for the next page
    else if (index == _currentPagValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPagValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    }

    //Condition for the previous page tranformation
    else if (index == _currentPagValue.floor() - 1) {
      var currScale = 1 - (_currentPagValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    }
    // Condition for any remaining page
    else {
      var currScale = 0.8;
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          // Restaurant Profile container - display the Dp of the restaurant
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            height: 220,
            decoration: BoxDecoration(
              color: index.isEven ? Colors.grey : Colors.green,
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/food2.webp'),
              ),
            ),
          ),

          //The section for  restaurant summary data
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              height: 130,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Chinese Slide"),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        // The stars for rating
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => const Icon(Icons.star,
                                size: 15, color: Styles.mainColor),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SmallText(text: '4.5'),
                        const SizedBox(width: 10),
                        SmallText(text: '1287 comments'),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // The section for restaurant statics (quality, location & delivery time)
                    const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndText(
                            icon: Icons.circle,
                            text: 'Normal',
                            color: Styles.signColor,
                            iconColor: Styles.iconColor1,
                          ),
                          IconAndText(
                            icon: Icons.location_on,
                            text: '1.7 km',
                            iconColor: Styles.mainColor,
                            color: Styles.signColor,
                          ),
                          IconAndText(
                            icon: Icons.timer,
                            text: '32 min',
                            iconColor: Styles.iconColor2,
                            color: Styles.signColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
