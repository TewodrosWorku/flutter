
import 'package:equatable/equatable.dart';

class CounterState extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => null;
  }

class InitVal extends CounterState {
  final counter;
  InitVal(this.counter);
  @override
  // TODO: implement props
  List<Object> get props => [counter];

}
class Increment extends CounterState {
  final counter;
  Increment(this.counter);
  @override
  // TODO: implement props
  List<Object> get props => [counter];

}