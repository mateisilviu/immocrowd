import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../core/util/app-constants.dart';
import '../../core/util/responsive.dart';
import '../widgets/general/footer/footer.dart';
import '../widgets/general/header.dart';
import '../widgets/general/left_description.dart';
import '../widgets/user/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static String routeName = '/';

  var homePageImages = [
    '/images/homepage/apartment_600.jpg',
    '/images/homepage/commercial_600.jpg',
    '/images/homepage/parking_600.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    var padding = ResponsiveWidget.calculatePadding_20_100_150(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(title: const InkWell(child: Text(AppConstants.TITLE)))
          : null, // Your app bar
      // backgroundColor: const Color(0xff6ae792),
      drawer: ResponsiveWidget.isSmallScreen(context) ? AppDrawer() : null,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Top Header
            if (ResponsiveWidget.isSmallScreen(context) == false)
              Padding(
                padding:
                    EdgeInsets.only(left: padding, top: 20, right: padding),
                child: HeaderWidget(),
              ),
            SizedBox(
                height: 600,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    addBackground(
                        "assets/images/home_page1.png", Alignment.centerRight),
                    Padding(
                      padding: EdgeInsets.only(
                          left: padding, top: 0, right: padding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          LeftDescription(),
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 50,
            ),
            MidHomeAnimationWidget(
                padding: padding, homePageImages: homePageImages),
            FooterComponent()
          ],
        ),
      ),
    );
  }

  //Adds background Image
  Widget addBackground(String assetImg, Alignment alignment) {
    return FractionallySizedBox(
        alignment: alignment, //to keep images aligned to right
        widthFactor: .6, //covers about 60% of the screen width
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
          image: AssetImage(assetImg),
        ))));
  }
}

class MidHomeAnimationWidget extends StatefulWidget {
  const MidHomeAnimationWidget({
    Key? key,
    required this.padding,
    required this.homePageImages,
  }) : super(key: key);

  final double padding;
  final List<String> homePageImages;

  @override
  State<MidHomeAnimationWidget> createState() => _MidHomeAnimationWidgetState();
}

class _MidHomeAnimationWidgetState extends State<MidHomeAnimationWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 600,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: widget.padding, top: 0, right: widget.padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        width: 1000,
                        height: 600,
                        //decoration: BoxDecoration(color: Colors.amber),
                        child: Row(
                          children: [
                            Text(
                              "Build your real estate portofolio with ",
                              style: TextStyle(fontSize: 38),
                            ),
                            AnimatedTextKit(
                                onNext: (next, variable) =>
                                    {_controller.animateToPage(next)},
                                repeatForever: true,
                                animatedTexts: [
                                  ScaleAnimatedText('a parking space',
                                      textStyle: TextStyle(fontSize: 38),
                                      duration: Duration(seconds: 3)),
                                  ScaleAnimatedText('a rented apartment',
                                      duration: Duration(seconds: 3),
                                      textStyle: TextStyle(fontSize: 38)),
                                  ScaleAnimatedText('a comercial place',
                                      duration: Duration(seconds: 3),
                                      textStyle: TextStyle(fontSize: 38)),
                                ])
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 600,
                        height: 600,
                        child: CarouselSlider(
                          carouselController: _controller,
                          options: CarouselOptions(
                              pauseAutoPlayOnManualNavigate: false,
                              pauseAutoPlayOnTouch: false,
                              viewportFraction: 1.0,
                              autoPlay: false,
                              aspectRatio: 1),
                          items: widget.homePageImages
                              .map((assetName) => Container(
                                  child: Center(
                                    child: Text(
                                      "BLA",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(assetName)))))
                              .toList(),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
