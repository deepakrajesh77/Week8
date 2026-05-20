import '../models/counter_model.dart';

class CounterController {
  final CounterModel _model = CounterModel();

  int get counterValue => _model.value;

  void increment() {
    _model.value++;
  }

  void decrement() {
    _model.value--;
  }

  void reset() {
    _model.value = 0;
  }
}