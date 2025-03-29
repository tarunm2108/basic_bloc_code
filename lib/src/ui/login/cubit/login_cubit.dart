import 'package:basic_bloc_code/app_cubit/app_cubit.dart';
import 'package:basic_bloc_code/app_locale/lang_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final emailNode = FocusNode();
  final passNode = FocusNode();

  LoginCubit() : super(LoginInitial(selectedLang: languages.first));

  void hideShowPass() {
    final last = state as LoginInitial;
    emit(last.copyWith(hasHidePass: !(last.hasHidePass ?? false)));
  }

  Future<void> loginTap() async {
    // if (emailCtrl.text.trim().isEmpty) {
    //   showToast(msg: 'Please enter email.');
    // } else if (passCtrl.text.trim().isEmpty) {
    //   showToast(msg: 'Please enter password.');
    // } else if (!GetUtils.isEmail(emailCtrl.text.trim())) {
    //   showToast(msg: 'Please enter valid email.');
    // } else {
    //   emailNode.unfocus();
    //   passNode.unfocus();
    //   setBusy = true;
    //   await Future.delayed(const Duration(seconds: 3));
    //   setBusy = false;
    // }
  }

  void changeLocale(LangModel? langModel, BuildContext context) {
    final last = state as LoginInitial;
    context.read<AppCubit>().changeLocale(langModel?.code ?? 'en');
    emit(last.copyWith(selectedLang: langModel));
  }

  void goToListDemo(){
   // NavigationService.instance.navigateTo(AppRoutes.listViewDemo);
  }
}
