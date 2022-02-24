import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class FAQ extends Equatable {
  const FAQ({
    required this.question,
    required this.answer,
    required this.order,
    required this.reference,
  });

  factory FAQ.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot;

    return FAQ(
      reference: snapshot.reference,
      question: data['question'],
      answer: data['answer'],
      order: data['order'],
    );
  }

  final String question;
  final String answer;
  final int order;
  final DocumentReference reference;

  @override
  List<Object> get props => [
        question,
        answer,
        order,
        reference,
      ];
}
