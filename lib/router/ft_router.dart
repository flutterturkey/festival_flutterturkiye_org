import 'package:auto_route/auto_route_annotations.dart';
import 'package:festival_flutterturkiye_org/event_flow/ui/event_flow_section.dart';
import 'package:festival_flutterturkiye_org/speaker/ui/speaker_section.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute<dynamic>(page: SpeakerSection, path: 'speakers'),
  MaterialRoute<dynamic>(page: EventFlowSection, path: 'event-flow'),
])
class $FTRouter {}
