part of 'app_cubit.dart';

abstract class AppState {
  final Locale locale;

  AppState(this.locale);
}

class AppInitial extends AppState {
  AppInitial(super.locale);

}
class AppLoaded extends AppState {
  AppLoaded(super.locale);
}

class AppNoInternet extends AppState {
  AppNoInternet(super.locale);
}
