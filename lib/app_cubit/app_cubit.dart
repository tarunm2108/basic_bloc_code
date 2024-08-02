import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final Connectivity connectivity = Connectivity();
  StreamSubscription? connectivityStreamSubscription;

  AppCubit() : super(AppInitial(const Locale('en')));

  Future<void> init() async {
    final checkResult = await connectivity.checkConnectivity();
    emitInternetConnection(checkResult);
    connectivityStreamSubscription = connectivity.onConnectivityChanged.listen(
        (connectivityResult) => emitInternetConnection(connectivityResult));
  }

  void emitInternetConnection(List<ConnectivityResult> connectivityResult) {
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      emit(AppLoaded(const Locale('en')));
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      emit(AppNoInternet(const Locale('en')));
    }
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription?.cancel();
    return super.close();
  }

  void changeLocale(String langCode) {
    emit(AppLoaded(Locale(langCode)));
  }
}
