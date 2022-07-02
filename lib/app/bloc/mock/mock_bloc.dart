import 'package:bloc/bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:test/app/bloc/mock/mock_events.dart';
import 'package:test/app/bloc/mock/mock_state.dart';
import 'package:test/app/repositories/mock/mock_repository.dart';
import 'package:test/app/models/search_result_error.dart';

const _duration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class MockBloc extends Bloc<MockEvent, MockState> {
  final MockRepository? mockRepository;

  MockBloc({this.mockRepository}) : super(MockStateEmpty()) {
    on<TextChanged>(_onTextChanged, transformer: debounce(_duration));
  }

  void _onTextChanged(
    TextChanged event,
    Emitter<MockState> emit,
  ) async {
    final mockTerm = event.text;

    if (mockTerm.isEmpty) return emit(MockStateEmpty());

    emit(MockStateLoading());

    try {
      final results = await mockRepository!.getAll();
      emit(MockStateSuccess(results.items));
    } catch (error) {
      emit(error is SearchResultError
          ? MockStateError(error.message)
          : const MockStateError('something went wrong'));
    }
  }
}
