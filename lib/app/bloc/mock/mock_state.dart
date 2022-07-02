import 'package:equatable/equatable.dart';
import 'package:test/app/models/mock_model.dart';

abstract class MockState extends Equatable {
  const MockState();

  @override
  List<Object> get props => [];
}

class MockStateEmpty extends MockState {}

class MockStateLoading extends MockState {}

class MockStateSuccess extends MockState {
  const MockStateSuccess(this.items);

  final List<MockModel> items;

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'MockStateSuccess { items: ${items.length} }';
}

class MockStateError extends MockState {
  const MockStateError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
