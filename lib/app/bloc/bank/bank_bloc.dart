import 'package:bloc/bloc.dart';
import 'package:test/app/bloc/bank/bank_events.dart';
import 'package:test/app/bloc/bank/bank_state.dart';
import 'package:test/app/repositories/bank/bank_repository.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:test/app/models/search_result_error.dart';

const _duration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class BankBloc extends Bloc<BankEvent, BankState> {
  final BankRepository? bankRepository;

  BankBloc({this.bankRepository}) : super(BankStateEmpty()) {
    on<TextChanged>(_onTextChanged, transformer: debounce(_duration));
  }

  void _onTextChanged(
    TextChanged event,
    Emitter<BankState> emit,
  ) async {
    final bankTerm = event.text;

    if (bankTerm.isEmpty) return emit(BankStateEmpty());

    emit(BankStateLoading());

    try {
      final results = await bankRepository!.getAll();
      emit(BankStateSuccess(results!.items));
    } catch (error) {
      emit(error is SearchResultError
          ? BankStateError(error.message)
          : const BankStateError('something went wrong'));
    }
  }
}
