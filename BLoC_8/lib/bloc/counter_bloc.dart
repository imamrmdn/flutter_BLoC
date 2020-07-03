import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => CounterState(value: 0);

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    yield (event is Increment)
        ? CounterState(value: state.value + 1)
        : CounterState(
            value: (state.value > 0) ? state.value - 1 : state.value);
  }
}
