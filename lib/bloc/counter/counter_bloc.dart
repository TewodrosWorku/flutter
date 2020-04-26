import 'dart:async';
import 'package:flash_chat/bloc/counter/counter_event.dart';
import 'package:flash_chat/bloc/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter=0;
  @override
  void onTransition(
      Transition<CounterEvent, CounterState> transition) {
    print(transition);
  }


  @override
  CounterState get initialState => InitVal(0);

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is Inc) {
      print( 'counter before ++ at counter '+counter.toString());
      final int c=counter++;
      counter=c;
      print('after inc at cb  '+c.toString());
      yield Increment(c);
    }
  }
}
