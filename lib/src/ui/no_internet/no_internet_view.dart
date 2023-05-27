import 'package:basic_bloc_code/app_locale/locale_string/lang_key.dart';
import 'package:basic_bloc_code/src/extensions/space_extension.dart';
import 'package:basic_bloc_code/src/extensions/string_extension.dart';
import 'package:basic_bloc_code/src/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.wifi_off_rounded,
              size: 120,
            ),
            20.toSpace,
            Text(LangKey.noInternet.tr(context))
          ],
        ),
      ),
    );
  }
}
