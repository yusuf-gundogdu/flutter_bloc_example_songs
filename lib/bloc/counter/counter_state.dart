part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();
}

class CounterInitial extends CounterState {
  final int counter;

  const CounterInitial({required this.counter});

  @override
  List<Object> get props => [counter];
}
