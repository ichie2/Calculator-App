import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:calculator_app/constants/enum_constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;

  StreamSubscription streamSubscription;

  InternetCubit(this.connectivity) : super(InternetLoading()) {
    initialize();
  }

  StreamSubscription<ConnectivityResult> initialize() {
    return streamSubscription =
        connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile) {
        emit(InternetConnected(ConnectionType.Wifi));
      } else if (event == ConnectivityResult.wifi) {
        emit(InternetConnected(ConnectionType.Wifi));
      } else {
        emit(InternetDisconnected());
      }
    });
  }
}
