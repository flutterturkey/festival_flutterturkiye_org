import 'package:flutter/material.dart';

import 'package:festival_flutterturkiye_org/core/model/activity_flow.dart';
import 'package:festival_flutterturkiye_org/core/ui/section_title.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:festival_flutterturkiye_org/activity_flow/activity_flow_widget.dart';

class ActivityFlowView extends StatelessWidget {
  const ActivityFlowView({
    @required this.activityFlowList,
    Key key,
  })  : assert(activityFlowList != null),
        super(key: key);

  final List<ActivityFlow> activityFlowList;

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFF212937),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SectionTitle(
                title: '24 saat sürecek bu heyecana sen de dahil ol',
                textColor: ThemeHelper.appBarActionColor,
                textAlign: TextAlign.start,
              ),
            ),
            _ActivityFlowListView(activityFlowList: activityFlowList),
          ],
        ),
      );
}

class _ActivityFlowListView extends StatelessWidget {
  const _ActivityFlowListView({
    @required this.activityFlowList,
    Key key,
  })  : assert(activityFlowList != null),
        super(key: key);

  final List<ActivityFlow> activityFlowList;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: activityFlowList.length,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => ActivityFlowWidget(
            title: activityFlowList[index].title,
            subtitle: activityFlowList[index].subtitle,
            iconPath: activityFlowList[index].iconPath,
            index: index,
            isLastIndex: (index == 3) || false,
          ),
        ),
      );
}
