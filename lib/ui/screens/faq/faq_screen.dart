import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:immocrowd/core/models/faq/FaqEntity.dart';

import '../../../core/util/responsive.dart';
import '../../widgets/general/footer/footer.dart';
import '../../widgets/general/header.dart';

class FaqScreen extends StatefulWidget {
  static const String routeName = '/faq';
  static const String title = "Freqvently Asked Questions";

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final searchController = TextEditingController();
  List<FaqEntity> faqEntities = FaqEntity.allFaqStatic;

  @override
  Widget build(BuildContext context) {
    final style = searchController.text.isEmpty
        ? const TextStyle(color: Colors.black54)
        : const TextStyle(color: Colors.black);
    final double responsiveHeight =
        ResponsiveWidget.isSmallScreen(context) ? 500 : 800;
    return Scaffold(
      appBar: HeaderWidget(title: FaqScreen.title),
      body: SingleChildScrollView(
        primary: true,
        child: Center(
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: searchController.text.isNotEmpty
                        ? GestureDetector(
                            child: Icon(Icons.close, color: style.color),
                            onTap: () {
                              searchController.clear();
                              FocusScope.of(context).requestFocus(FocusNode());

                              searchItems('');
                            },
                          )
                        : null,
                    hintText: 'Your question',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black26),
                    ),
                  ),
                  onChanged: searchItems,
                ),
              ),
              SizedBox(
                height: responsiveHeight,
                width: 300,
                child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: faqEntities.length,
                    itemBuilder: (context, index) {
                      final faqItem = faqEntities[index];
                      return Card(
                        elevation: 5,
                        child: Container(
                            color: Theme.of(context).primaryColor,
                            width: 300,
                            //height: 200,
                            child: Column(
                              children: [
                                Text(faqItem.question),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(faqItem.answer),
                              ],
                            )),
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              FooterComponent(),
            ],
          ),
        ),
      ),
    );
  }

  searchItems(String query) {
    final suggestions = faqEntities.where((item) {
      final question = item.question.toLowerCase();
      final answer = item.answer.toLowerCase();
      final input = query.toLowerCase();
      if (question.contains(input)) return question.contains(input);
      if (answer.contains(input)) return answer.contains(input);
      return false;
    }).toList();

    setState(() => faqEntities = suggestions);
  }
}
