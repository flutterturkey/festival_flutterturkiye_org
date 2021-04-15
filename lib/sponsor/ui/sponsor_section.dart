import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:festival_flutterturkiye_org/core/logic/sponsor_repository.dart';
import 'package:festival_flutterturkiye_org/core/model/sponsor.dart';
import 'package:festival_flutterturkiye_org/core/ui/responsive_builder.dart';
import 'package:festival_flutterturkiye_org/core/ui/section_title.dart';
import 'package:festival_flutterturkiye_org/core/utils/get_it_initializer.dart';
import 'package:festival_flutterturkiye_org/sponsor/ui/sponsor_card.dart';

class SponsorSection extends StatelessWidget {
  const SponsorSection({
    @required this.focusNode,
    Key key,
  })  : assert(focusNode != null),
        super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final _sessionRepository = getIt.get<SponsorRepository>();
    return Focus(
      focusNode: focusNode,
      child: Column(
        children: [
          const SectionTitle(title: 'Sponsorlarımız'),
          const _SponsorSectionInfoTitle(
            title: 'Etkinliğimize sponsor olmak için '
                'sponsorluk@flutterturkiye.org üzerinden '
                'iletişime geçebilirsiniz.',
          ),
          const SizedBox(height: 15),
          _SponsorsBuilder(
            sponsorsList: _sessionRepository.goldSponsors,
            sponsorTypeTitle: 'Gold',
          ),
          const SizedBox(height: 25),
          _SponsorsBuilder(
            sponsorsList: _sessionRepository.silverSponsors,
            sponsorTypeTitle: 'Silver',
          ),
          const SizedBox(height: 25),
          _SponsorsBuilder(
            sponsorsList: _sessionRepository.bronzSponsors,
            sponsorTypeTitle: 'Bronz',
          ),
          const SizedBox(height: 25),
          _SponsorsBuilder(
            sponsorsList: _sessionRepository.mediaSponsors,
            sponsorTypeTitle: 'Medya',
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class _SponsorSectionInfoTitle extends StatelessWidget {
  const _SponsorSectionInfoTitle({
    @required this.title,
    this.fontSize = 18,
    Key key,
  })  : assert(title != null),
        assert(fontSize != null),
        super(key: key);

  final String title;
  final double fontSize;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}

class _SponsorsBuilder extends StatelessWidget {
  const _SponsorsBuilder({
    @required this.sponsorsList,
    @required this.sponsorTypeTitle,
    Key key,
  })  : assert(sponsorsList != null),
        assert(sponsorTypeTitle != null),
        super(key: key);

  final List<Sponsor> sponsorsList;
  final String sponsorTypeTitle;

  @override
  Widget build(BuildContext context) {
    final isSmall = sponsorTypeTitle == 'Medya';

    return Visibility(
      visible: sponsorsList.isNotEmpty,
      child: ResponsiveBuilder(
        smallWidget: _SponsorsSlider(
          aspectRatio: isSmall ? 5 : 2.75,
          viewportFraction: isSmall ? 0.3 : 0.4,
          sponsorsList: sponsorsList,
          sponsorTypeTitle: sponsorTypeTitle,
        ),
        largeWidget: _SponsorsSlider(
          aspectRatio: isSmall ? 16 : 9,
          viewportFraction: isSmall ? 0.1 : 0.15,
          sponsorsList: sponsorsList,
          sponsorTypeTitle: sponsorTypeTitle,
        ),
      ),
    );
  }
}

class _SponsorsSlider extends StatefulWidget {
  const _SponsorsSlider({
    @required this.aspectRatio,
    @required this.viewportFraction,
    @required this.sponsorsList,
    @required this.sponsorTypeTitle,
    Key key,
  })  : assert(aspectRatio != null),
        assert(viewportFraction != null),
        assert(sponsorsList != null),
        assert(sponsorTypeTitle != null),
        super(key: key);

  final double aspectRatio;
  final double viewportFraction;
  final List<Sponsor> sponsorsList;
  final String sponsorTypeTitle;

  @override
  __SponsorsSliderState createState() => __SponsorsSliderState();
}

class __SponsorsSliderState extends State<_SponsorsSlider> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          _SponsorSectionInfoTitle(
              title: widget.sponsorTypeTitle, fontSize: 32),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              enableInfiniteScroll: false,
              initialPage: 1,
              aspectRatio: widget.aspectRatio,
              viewportFraction: widget.viewportFraction,
            ),
            items: widget.sponsorsList
                .map((sponsor) => SponsorCard(sponsor: sponsor))
                .toList(growable: false),
          ),
        ],
      );
}
