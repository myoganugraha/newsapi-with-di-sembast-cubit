part of 'connectivity_cubit.dart';

@immutable
abstract class ConnectivityState {
  const ConnectivityState();
}

class ConnecitivityInitial extends ConnectivityState {
  const ConnecitivityInitial();
}

class ConnectivityOK extends ConnectivityState {
  const ConnectivityOK();
}

class ConnectivityError extends ConnectivityState {
  final String message;
  const ConnectivityError(this.message);
}
