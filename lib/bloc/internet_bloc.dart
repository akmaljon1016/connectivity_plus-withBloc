import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'internet_event.dart';

part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? subscription;

  InternetBloc() : super(InternetInitial()) {
    on<OnConnected>((event, emit) {
      emit(OnConnectedState(event.connectionType));
    });
    on<OnNotConnected>((event, emit) {
      emit(OnNotConnectedState());
    });

    subscription = Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi) {
        add(OnConnected(ConnectionType.Wifi));
      } else if (event == ConnectivityResult.mobile) {
        add(OnConnected(ConnectionType.Mobile));
      }
      else{
        add(OnNotConnected());
      }
    });
  }
}
