import 'package:basic_bloc_code/app_routes/app_routes.dart';
import 'package:basic_bloc_code/utils/navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> init() async {
    // await Future.delayed(const Duration(seconds: 2)).whenComplete(
    //     () => NavigationService.instance.navigateTo(AppRoutes.login));
  }
}
