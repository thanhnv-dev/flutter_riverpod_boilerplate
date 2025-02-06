import 'package:flutter_mvvm_riverpod_boilerplate/features/home/domain/entities/counter.dart';

abstract class CounterRepository {
  Future<Counter> getCounter();
  Future<void> saveCounter(Counter counter);
}
