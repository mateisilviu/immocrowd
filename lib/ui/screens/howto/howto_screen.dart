import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/general/header.dart';
import '../view_properties.dart';

class HowToScreen extends StatefulWidget {
  const HowToScreen({Key? key}) : super(key: key);
  static const String routeName = '/how-it-works';
  static const String title = "How it works";

  @override
  State<HowToScreen> createState() => _HowToScreenState();
}

class _HowToScreenState extends State<HowToScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var paddingMultiplier = 0.15;
    if (screenWidth < 800) {
      paddingMultiplier = 0.01;
    }

    return Scaffold(
      appBar: HeaderWidget(title: HowToScreen.title),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: screenWidth * paddingMultiplier),
        child: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
            },
            children: [
              buildPage(
                color: Colors.green.shade100,
                urlImage: 'assets/images/howto/decide.png',
                title: 'DECIDE',
                subtitle:
                    'Choose from available properties the one that you want to invest into. Choose the amount you want to invest. Sign the promise investmant agreemant.',
              ),
              buildPage(
                color: Colors.blue.shade100,
                urlImage: 'assets/images/howto/sign_documents.png',
                title: 'SIGN',
                subtitle:
                    'Once the property reaches 100% invested, we will create a special company called \'SPV\' (Special Purpose Vehicul) where everybody has shares proportional with the invested amount. Documents needs to be signed at this step and the amount invested will be transfered.',
              ),
              buildPage(
                color: Colors.orange.shade100,
                urlImage: 'assets/images/howto/celebrate.png',
                title: 'CELEBRATE',
                subtitle:
                    'The new formed company - SPV - will buy the property. We will take care of all documents. Once the property is bought, we list it for rent using our partners. You will receive dividents from the rent proportional with the invested amount.',
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: screenWidth * paddingMultiplier),
        child: isLastPage
            ? ElevatedButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  //   primary: Colors.white,
                  //  backgroundColor: Colors.teal.shade700,
                  minimumSize: const Size.fromHeight(80),
                ),
                child: const Text(
                  'Be part of co-owner generation too!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () async {
                  Navigator.of(context)
                      .pushReplacementNamed(ViewPropertiesScreen.routeName);
                },
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      child: const Text('SKIP'),
                      onPressed: () => controller.jumpToPage(2),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: WormEffect(
                          spacing: 16,
                          dotColor: Colors.black26,
                          activeDotColor: Colors.teal.shade700,
                        ),
                        onDotClicked: (index) => controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      child: const Text('NEXT'),
                      onPressed: () => controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: Image(
                  fit: BoxFit.scaleDown,
                  width: double.infinity,
                  image: AssetImage(urlImage)),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                color: Colors.teal.shade700,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Text(
                subtitle,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ],
        ),
      );
}
