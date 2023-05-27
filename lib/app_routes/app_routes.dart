import 'package:basic_bloc_code/src/ui/login/login_view.dart';
import 'package:basic_bloc_code/src/ui/no_internet/no_internet_view.dart';

class AppRoutes {
  static const login = '/';
  static const noInternet = '/NoInternetView';

  static final routes = {
    login: (context) => const LoginView(),
    noInternet: (context) => const NoInternetView(),
  };
}
