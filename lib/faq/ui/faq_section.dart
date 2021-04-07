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
    const FAQItem(question: 'question', answer: 'answer'),
    const FAQItem(question: 'question', answer: 'answer'),
    const FAQItem(question: 'question', answer: 'answer'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      color: ThemeHelper.darkColor,
      height: screenSize.height,
      child: ListView.builder(
          primary: false,
          itemCount: faqList.length,
          itemBuilder: (context, index) {
            var isExpanded = false;
            final item = faqList[index];
            return Theme(
              data: ThemeData(),
              child: ExpansionTile(
                  expandedAlignment: const Alignment(-1, 0),
                  childrenPadding: const EdgeInsets.symmetric(horizontal: 32),
                  title: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      width: screenSize.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Text(
                                item.question,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Text(
                              !isExpanded ? '+' : '-',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      )),
                  trailing: Text(
                    !isExpanded ? '+' : '-',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  //backgroundColor: ThemeHelper.activityFlowColor,
                  onExpansionChanged: (value) {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                    print(isExpanded);
                  },
                  children: [
                    Text(
                      item.answer,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ]),
            );
          }),
    );
  }
}
