import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myflix/src/common_widget/common_widget.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/presentations.dart';
import 'package:myflix/src/routes/app_routes.dart';
import 'package:myflix/src/shared/extensions/extensions.dart';

class LoginButtonSection extends ConsumerWidget {
  const LoginButtonSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(loginControllerProvider.notifier);
    final state = ref.watch(loginControllerProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ButtonWidget.outlined(
          text: 'Login',
          onTap: controller.login,
          isLoading: state.isLoading,
        ),
        Gap.h32,
        GestureDetector(
          onTap: () {
            context.goNamed(Routes.register.name);
          },
          child: Text(
            'Not a Member yet? Register Here',
            style: TypographyApp.headline3,
          ),
        ),
        Gap.h16,
        Text(
          'Forgot Password?',
          style: TypographyApp.text1.grey,
        )
      ],
    );
  }
}
