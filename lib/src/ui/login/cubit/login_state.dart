part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {
  final bool? hasHidePass;
  final LangModel selectedLang;

  LoginInitial({this.hasHidePass = true, required this.selectedLang});

  LoginInitial copyWith({
    bool? hasHidePass,
    LangModel? selectedLang,
  }) {
    return LoginInitial(
      hasHidePass: hasHidePass ?? this.hasHidePass,
      selectedLang: selectedLang ?? this.selectedLang,
    );
  }
}
