import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial(counter: 0)) {
    on<CounterEvent>((event, emit) {
      final s = (state as CounterInitial).counter;
      if (event is IncrementEvent) {
        emit(CounterInitial(counter: s + 1));
      }
      if (event is DecrementEvent) {
        emit(CounterInitial(counter: s - 1));
      }
    });
  }
}