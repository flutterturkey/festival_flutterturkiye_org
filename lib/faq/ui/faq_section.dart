import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:festival_flutterturkiye_org/faq/model/faq_item.dart';
import 'package:flutter/material.dart';

class FAQSection extends StatefulWidget {
  const FAQSection({Key key}) : super(key: key);

  @override
  _FAQSectionState createState() => _FAQSectionState();
}

class _FAQSectionState extends State<FAQSection> {
  List<FAQItem> faqList = [
    const FAQItem(
        question:
            '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit''',
        answer:
            '''Vestibulum finibus lacus felis, in vulputate eros molestie ac. Nullam eget vulputate elit. Vestibulum finibus lacus felis, in vulputate eros molestie ac. Nullam eget vulputate elit. Vestibulum finibus lacus felis, in vulputate eros molestie ac. Nullam eget vulputate elit.'''),
    const FAQItem(
        question:
            'Mauris varius posuere porta. Aliquam maximus feugiat consequat.',
        answer:
            'Maecenas at mauris mattis, pellentesque nulla ac, rhoncus velit.'),
    const FAQItem(
        question:
            '''Morbi suscipit consectetur hendrerit. Donec sit amet odio sollicitudin, hendrerit ipsum a, mollis sapien.''',
        answer:
            '''Quisque diam purus, lacinia vestibulum mattis nec, luctus et risus.'''),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      color: ThemeHelper.darkColor,
      height: screenSize.height,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        primary: false,
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          final item = faqList[index];
          return ExpansionTileCard(
            initialPadding: const EdgeInsets.symmetric(vertical: 8),
            finalPadding: const EdgeInsets.symmetric(vertical: 16),
            baseColor: ThemeHelper.footerTextColor,
            duration: const Duration(milliseconds: 100),
            expandedTextColor: Colors.black,
            expandedColor: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            title: Text(item.question),
            children: <Widget>[
              const Divider(
                thickness: 1,
                height: 1,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Text(
                    item.answer,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontSize: 16),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
