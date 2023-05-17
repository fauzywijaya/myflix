import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/common_widget/common_widget.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/presentations.dart';

class RegisterFormSection extends ConsumerWidget {
  const RegisterFormSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerControllerProvider);
    final controller = ref.read(registerControllerProvider.notifier);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InputFormWidget(
          controller: controller.emailController,
          hintText: "Email",
          onChanged: (value) {},
        ),
        Gap.h16,
        InputFormWidget.password(
          controller: controller.passwordController,
          hintText: "Password",
          onObsecureTap: controller.onObscureTap,
          isObsecure: state.isObsecure,
        ),
        Gap.h16,
        InputFormWidget(
          controller: controller.emailController,
          hintText: "Username",
          onChanged: (value) {},
        ),
        Gap.h16,
        InputFormWidget(
          controller: controller.birthdateController,
          onChanged: (value) {},
          hintText: 'Birthdate',
        ),
        Gap.h16,
        InputFormWidget(
          controller: controller.genderController,
          onChanged: (value) {},
          hintText: 'Gender',
        ),
      ],
    );
  }
}
