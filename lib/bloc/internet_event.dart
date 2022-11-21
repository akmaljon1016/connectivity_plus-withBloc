part of 'internet_bloc.dart';

abstract class InternetEvent extends Equatable {
  const InternetEvent();
}

class OnConnected extends InternetEvent {
  final ConnectionType connectionType;

  const OnConnected(this.connectionType);

  @override
  List<Object> get props => [connectionType];
}

class OnNotConnected extends InternetEvent {
  @override
  List<Object> get props => [];
}
