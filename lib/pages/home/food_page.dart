import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/app_colum.dart';
import 'package:delivery_app/widgets/big_text.dart';
import 'package:delivery_app/widgets/icon_text.dart';
import 'package:delivery_app/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var _currentPagValue = 0.0;
  final _scaleFactor = 0.8;
  final _height = Layout.pageViewContainer;

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
    return Column(
      children: [
        //Slider section
        Container(
          //scolor: Colors.grey,
          height: Layout.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        //The dots indicator
        DotsIndicator(
          dotsCount: 5,
          position: _currentPagValue,
          decorator: DotsDecorator(
            activeColor: Styles.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),

        //The Gapo before popular section
        SizedBox(
          height: Layout.height30,
        ),

        //The popular section
        Container(
          margin: EdgeInsets.only(left: Layout.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              SizedBox(width: Layout.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(width: Layout.width10),
              Container(
                  margin: const EdgeInsets.only(
                    bottom: 4.0,
                  ),
                  child: SmallText(text: 'Food Pairing')),
            ],
          ),
        ),

        //List of food Images
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                  left: Layout.width20,
                  right: Layout.width20,
                  bottom: Layout.height10),
              child: Row(
                children: [
                  Container(
                    width: Layout.listViewImg,
                    height: Layout.listViewImg,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Layout.radius20),
                        color: Colors.black12,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/food5.jpeg',
                          ),
                        )),
                  ),

                  //Container for popular
                  //food pairing
                  Expanded(
                    child: Container(
                      //width: 220,
                      height: Layout.listViewtextCont,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Layout.radius20),
                            bottomRight: Radius.circular(Layout.radius20)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Layout.width10, right: Layout.width10),
                        child: const AppColumn(
                          text: "Chinese Side",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

/* 
  This the food Container displaying restaurants data, distance, dishes a
  And delivery time
  A single widget to be rendered for the page builder

 */
  Widget _buildPageItem(int index) {
    //Checking the page view and making the transformation
    Matrix4 matrix = Matrix4.identity();

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
            margin:
                EdgeInsets.only(left: Layout.width10, right: Layout.width10),
            height: Layout.pageViewContainer,
            decoration: BoxDecoration(
              color: index.isEven ? Colors.grey : Colors.green,
              borderRadius: BorderRadius.circular(Layout.radius30),
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
              margin: EdgeInsets.only(
                  left: Layout.width30,
                  right: Layout.width30,
                  bottom: Layout.height30),
              height: Layout.pageViewTextContainer,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Layout.radius20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  )
                ],
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(top: Layout.height10, left: Layout.width10),
                child: const AppColumn(
                  text: "Chinese Side",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
