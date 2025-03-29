import 'package:basic_bloc_code/app_locale/lang_model.dart';
import 'package:basic_bloc_code/app_locale/locale_string/lang_key.dart';
import 'package:basic_bloc_code/src/extensions/space_extension.dart';
import 'package:basic_bloc_code/src/extensions/string_extension.dart';
import 'package:basic_bloc_code/src/ui/login/cubit/login_cubit.dart';
import 'package:basic_bloc_code/src/widgets/app_bar_widget.dart';
import 'package:basic_bloc_code/src/widgets/app_button_widget.dart';
import 'package:basic_bloc_code/src/widgets/app_scaffold.dart';
import 'package:basic_bloc_code/src/widgets/app_text_field_widget.dart';
import 'package:basic_bloc_code/src/widgets/dropdown/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
        if (state is LoginInitial) {
          return AppScaffold(
            appBar: const AppBarWidget(title: "Login"),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  AppTextFieldWidget(
                    controller: context.read<LoginCubit>().emailCtrl,
                    hintText: LangKey.email.tr(context),
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    node: context.read<LoginCubit>().emailNode,
                  ),
                  20.toSpace,
                  AppTextFieldWidget(
                    controller: context.read<LoginCubit>().passCtrl,
                    hintText: LangKey.password.tr(context),
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    node: context.read<LoginCubit>().passNode,
                    obscureText: state.hasHidePass,
                    suffix: InkWell(
                      onTap: () => context.read<LoginCubit>().hideShowPass(),
                      child: Icon(state.hasHidePass ?? false
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                  20.toSpace,
                  AppButtonWidget(
                    onPressed: () => context.read<LoginCubit>().loginTap(),
                    title: LangKey.login.tr(context),
                  ),
                  40.toSpace,
                  DropdownButton2<LangModel>(
                    items: List.generate(
                      languages.length,
                      (index) => DropdownMenuItem(
                        value: languages[index],
                        child: Text(languages[index].title),
                      ),
                    ),
                    onChanged: (value) =>
                        context.read<LoginCubit>().changeLocale(value, context),
                    value: state.selectedLang,
                    underline: const SizedBox.shrink(),
                  ),
                  20.toSpace,
                  AppButtonWidget(
                    onPressed: () => context.read<LoginCubit>().goToListDemo(),
                    title: "ListView",
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}
