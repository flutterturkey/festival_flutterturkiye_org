import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class FAQItem extends Equatable {
  const FAQItem({
    @required this.question,
    @required this.answer,
  })  : assert(question != null),
        assert(answer != null);

  final String question;
  final String answer;

  @override
  List<Object> get props => [
        question,
        answer,
      ];
}
