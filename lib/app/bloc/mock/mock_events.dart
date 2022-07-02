import 'package:equatable/equatable.dart';

abstract class MockEvent extends Equatable {
  const MockEvent();
}

class TextChanged extends MockEvent {
  const TextChanged({required this.text});

  final String text;

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'TextChanged { text: $text }';
}
