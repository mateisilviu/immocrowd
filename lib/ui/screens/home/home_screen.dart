import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../core/util/app-constants.dart';
import '../../../core/util/responsive.dart';
import '../../widgets/general/appbar/login-buttons.dart';
import '../../widgets/general/calculator/calculator.dart';
import '../../widgets/general/footer/footer.dart';
import '../../widgets/general/header.dart';
import '../../widgets/user/app_drawer.dart';
import '../howto/howto_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static String routeName = '/';

  final CarouselController _controller = CarouselController();

  var homePageImages = [
    Image(image: AssetImage('assets/images/homepage/apartment_600.jpg')),
    Image(image: AssetImage('assets/images/homepage/commercial_600.jpg')),
    Image(image: AssetImage('assets/images/homepage/parking_600.jpg')),
  ];

  var generationImages = [
    Image(image: AssetImage('assets/images/homepage/gen_1.jpg')),
    Image(image: AssetImage('assets/images/homepage/gen_2.jpg')),
    Image(image: AssetImage('assets/images/homepage/gen_3.jpg')),
    Image(image: AssetImage('assets/images/homepage/gen_4.jpg')),
  ];

  @override
  Widget build(BuildContext context) {
    var padding = ResponsiveWidget.calculatePadding_20_100_150(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: HeaderWidget(), // Your app bar
      // backgroundColor: const Color(0xff6ae792),
      drawer: ResponsiveWidget.isSmallScreen(context) ? AppDrawer() : null,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            ResponsiveWidget.isSmallScreen(context)
                ? buildGenerationImageMobile(context)
                : Container(
                    height: 578,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/generation_1920.jpg'))),
                    child: null),
            ResponsiveWidget.isSmallScreen(context)
                ? buildFrontDescriptionMobile(context, padding)
                : buildFrontDescriptionDesktop(context, padding),
            SizedBox(
              height: 50,
            ),
            CalculatorWidget(),
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
        widthFactor: .8, //covers about 60% of the screen width
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
          image: AssetImage(assetImg),
        ))));
  }

  Widget buildGenerationImageMobile(BuildContext context) {
    return Container(
      height: 578,
      child: CarouselSlider(
        //carouselController: _controller,
        options: CarouselOptions(
            pauseAutoPlayOnManualNavigate: false,
            pauseAutoPlayOnTouch: false,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            aspectRatio: 1),
        items: generationImages,
      ),
    );
  }

  Widget buildFrontDescriptionMobile(BuildContext context, double padding) {
    return SizedBox(
        // height: 600,
        child: Padding(
      padding: EdgeInsets.only(left: padding, top: 0, right: padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildLeftDescription(context),
          SizedBox(
            height: 20,
          ),
          buildCarouselSlide(),
        ],
      ),
    ));
  }

  Widget buildFrontDescriptionDesktop(BuildContext context, double padding) {
    return SizedBox(
        height: 600,
        child: Padding(
          padding: EdgeInsets.only(left: padding, top: 0, right: padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildLeftDescription(context),
              buildCarouselSlide()
            ],
          ),
        ));
  }

  Widget buildCarouselSlide() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // decoration: BoxDecoration(color: Colors.amber),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                "Build your real estate portofolio with a ",
                style: TextStyle(fontSize: 20),
                maxLines: 3,
                minFontSize: 12,
              ),
              AnimatedTextKit(
                  onNext: (next, variable) => {_controller.animateToPage(next)},
                  repeatForever: true,
                  animatedTexts: [
                    ScaleAnimatedText('rented parking space',
                        textStyle: TextStyle(fontSize: 24),
                        duration: Duration(seconds: 3)),
                    ScaleAnimatedText('rented apartment',
                        duration: Duration(seconds: 3),
                        textStyle: TextStyle(fontSize: 24)),
                    ScaleAnimatedText('rented comercial place',
                        duration: Duration(seconds: 3),
                        textStyle: TextStyle(fontSize: 24)),
                  ])
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 500,
          height: 500,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.elliptical(5, 10)),
            child: CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                  pauseAutoPlayOnManualNavigate: false,
                  pauseAutoPlayOnTouch: false,
                  viewportFraction: 1.0,
                  autoPlay: false,
                  aspectRatio: 1),
              items: homePageImages,
            ),
          ),
        )
      ],
    );
  }

  Widget buildLeftDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AutoSizeText(
          'Simple smart investments',
          style: TextStyle(fontSize: 30),
          maxLines: 3,
          minFontSize: 18,
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 900,
          child: AutoSizeText(
            'Co-Owner Generation is a platform where you can build a real estate portofolio.You invest small amounts of money along side other investors. You will receive dividents from rented properties.',
            softWrap: true,
            style: TextStyle(fontSize: 24),
            maxLines: 7,
            minFontSize: 12,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(HowToScreen.routeName),
              child: AutoSizeText(
                'Learn more',
                minFontSize: 12,
                maxFontSize: 30,
              ),
            ),
            ...createLoginSignInButtons(context)
          ],
        ),
      ],
    );
  }
}
