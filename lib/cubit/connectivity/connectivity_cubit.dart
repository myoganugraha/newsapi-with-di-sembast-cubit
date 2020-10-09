import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit(ConnectivityState state) : super(state);

}