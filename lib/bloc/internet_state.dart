part of 'internet_bloc.dart';

enum ConnectionType { Wifi, Mobile }

abstract class InternetState extends Equatable {
  const InternetState();
}

class InternetInitial extends InternetState {
  @override
  List<Object> get props => [];
}

class OnConnectedState extends InternetState {
  final ConnectionType connectionType;

  const OnConnectedState(this.connectionType);

  @override
  List<Object> get props => [connectionType];
}

class OnNotConnectedState extends InternetState {
  @override
  List<Object> get props => [];
}
