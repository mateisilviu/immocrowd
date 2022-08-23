import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:immocrowd/ui/screens/howto/howto_screen.dart';

import '../../../core/util/app-constants.dart';
import '../../../core/util/responsive.dart';
import '../../widgets/general/appbar/login-buttons.dart';
import '../../widgets/general/footer/footer.dart';
import '../../widgets/general/header.dart';
import '../../widgets/user/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static String routeName = '/';

  final CarouselController _controller = CarouselController();

  var homePageImages = [
    Image.network(
        'https://firebasestorage.googleapis.com/v0/b/immocrowd-49e21.appspot.com/o/homepage%2Fapartmanet_600.jpg?alt=media&token=aa408dcf-0982-410c-b9b4-b9b98a3dea8e'),
    Image.network(
        'https://firebasestorage.googleapis.com/v0/b/immocrowd-49e21.appspot.com/o/homepage%2Fmage_600.jpg?alt=media&token=f349a593-7bf9-4ae3-89fa-eb17d3da5968'),
    Image.network(
        'https://firebasestorage.googleapis.com/v0/b/immocrowd-49e21.appspot.com/o/homepage%2Fparking_600.jpg?alt=media&token=a8cc0847-15f3-4765-8267-53f40e26bf84'),
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
                ? buildFrontDescriptionMobile(context, padding)
                : buildFrontDescriptionDesktop(context, padding),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AutoSizeText(
                "Build your real estate portofolio with a rented ",
                style: TextStyle(fontSize: 16),
                maxLines: 1,
                minFontSize: 12,
              ),
              AnimatedTextKit(
                  onNext: (next, variable) => {_controller.animateToPage(next)},
                  repeatForever: true,
                  animatedTexts: [
                    ScaleAnimatedText('parking space',
                        textStyle: TextStyle(fontSize: 16),
                        duration: Duration(seconds: 3)),
                    ScaleAnimatedText('apartment',
                        duration: Duration(seconds: 3),
                        textStyle: TextStyle(fontSize: 16)),
                    ScaleAnimatedText('comercial place',
                        duration: Duration(seconds: 3),
                        textStyle: TextStyle(fontSize: 16)),
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
          'Invest in real estate with a single click and small amount of money.',
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
            'coowner.estate is a platform where you can build a real estate portofolio.You invest small amounts of money along side other investors.You will receive dividents from rented properties.',
            softWrap: true,
            style: TextStyle(fontSize: 24),
            maxLines: 3,
            minFontSize: 14,
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
