// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:developer';

import 'package:bloc/bloc.dart';

/// {@template counter_cubit}
/// Cubit which manages the current [Counter] state.
/// {@counter_cubit}
class CounterCubit extends Cubit<int> {
  /// {@macro counter_cubit}
  CounterCubit() : super(0);

  /// increment the state by 1
  void increment() => emit(state + 1);

  /// decrement the state by 1
  void decrement() => emit(state - 1);
}
