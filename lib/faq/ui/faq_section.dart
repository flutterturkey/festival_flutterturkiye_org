import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:festival_flutterturkiye_org/core/logic/faq_repository.dart';
import 'package:festival_flutterturkiye_org/core/ui/section_title.dart';
import 'package:festival_flutterturkiye_org/core/utils/get_it_initializer.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';

class FAQSection extends StatelessWidget {
  FAQSection({Key key}) : super(key: key);

  final faqList = getIt.get<FaqRepository>().faqs;

  @override
  Widget build(BuildContext context) => Material(
        child: DecoratedBox(
          decoration: const BoxDecoration(color: ThemeHelper.darkColor),
          child: Column(
            children: [
              const SectionTitle(
                title: 'Sıkça Sorulan Sorular',
                textColor: ThemeHelper.lightColor,
              ),
              ListView.builder(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                shrinkWrap: true,
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
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    title: Text(item.question),
                    children: <Widget>[
                      const Divider(thickness: 1, height: 1),
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
            ],
          ),
        ),
      );
}
