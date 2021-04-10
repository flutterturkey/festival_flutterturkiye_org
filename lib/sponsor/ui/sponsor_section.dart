import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:festival_flutterturkiye_org/core/logic/sponsor_repository.dart';
import 'package:festival_flutterturkiye_org/core/ui/responsive_builder.dart';
import 'package:festival_flutterturkiye_org/core/ui/section_title.dart';
import 'package:festival_flutterturkiye_org/core/utils/get_it_initializer.dart';
import 'package:festival_flutterturkiye_org/sponsor/components/sponsor_section_info_title.dart';
import 'package:festival_flutterturkiye_org/sponsor/ui/sponsor_card.dart';

class SponsorSection extends StatelessWidget {
  const SponsorSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: const [
          SectionTitle(title: 'Sponsorlarımız'),
          SponsorSectionInfoTitle(),
          _SponsorsBuilder(),
          SizedBox(height: 100),
        ],
      );
}

class _SponsorsBuilder extends StatelessWidget {
  const _SponsorsBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const ResponsiveBuilder(
        smallWidget: _SponsorsSlider(
          aspectRatio: 5,
          viewportFraction: 0.3,
        ),
        largeWidget: _SponsorsSlider(
          aspectRatio: 9,
          viewportFraction: 0.15,
        ),
      );
}

class _SponsorsSlider extends StatelessWidget {
  const _SponsorsSlider({
    @required this.aspectRatio,
    @required this.viewportFraction,
    Key key,
  })  : assert(aspectRatio != null),
        assert(viewportFraction != null),
        super(key: key);

  final double aspectRatio;
  final double viewportFraction;

  @override
  Widget build(BuildContext context) {
    final sessionRepository = getIt.get<SponsorRepository>();
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        aspectRatio: aspectRatio,
        viewportFraction: viewportFraction,
      ),
      items: sessionRepository.sponsors
          .map((sponsor) => SponsorCard(sponsor: sponsor))
          .toList(growable: false),
    );
  }
}
