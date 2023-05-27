import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myflix/gen/assets.gen.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/exceptions/network_exceptions.dart';
import 'package:myflix/src/features/presentations.dart';
import 'package:myflix/src/routes/routes.dart';
import 'package:myflix/src/shared/extensions/build_context.dart';
import 'package:overlay_support/overlay_support.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginControllerProvider, (prevState, state) {
      if (prevState?.loginValue != state.loginValue) {
        state.loginValue.whenOrNull(
          data: (data) {
            if (data != null) {
              context.goNamed(Routes.home.name);
            }
          },
          error: (error, stackTrace) {
            final message =
                NetworkExceptions.getErrorMessage(error as NetworkExceptions);
            toast(message);
          },
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeApp.w32,
            vertical: SizeApp.h16,
          ),
          child: Column(
            children: [
              Center(
                child: Assets.icons.myflixLogo.svg(
                  width: context.screenWidthPercentage(0.32),
                  fit: BoxFit.fitWidth,
                ),
              ),
              const Spacer(),
              const LoginFormSection(),
              Gap.h32,
              const LoginButtonSection(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
