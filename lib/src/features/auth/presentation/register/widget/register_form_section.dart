import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/common_widget/common_widget.dart';
import 'package:myflix/src/common_widget/dropdown/dropdown_widget.dart';
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
          onChanged: (value) {},
          onObscureTap: controller.onObscureTap,
          isObscure: state.isObscure,
        ),
        Gap.h16,
        InputFormWidget(
          controller: controller.usernameController,
          hintText: "Username",
          onChanged: (value) {},
        ),
        Gap.h16,
        InputFormWidget.button(
          controller: controller.birthdateController,
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: state.birthDate ?? DateTime.now(),
              firstDate: DateTime(1980),
              lastDate: DateTime.now(),
            );
            controller.onBirthdatePick(pickedDate);
          },
          hintText: 'Birthdate',
        ),
        Gap.h16,
        DropDownWidget<int>(
          hintText: "Gender",
          items: [
            DropdownMenuItem(
              value: 0,
              child: Text(
                "Male",
                style: TypographyApp.text1,
              ),
            ),
            DropdownMenuItem(
              value: 1,
              child: Text(
                "Female",
                style: TypographyApp.text1,
              ),
            ),
          ],
          onChanged: controller.onGenderChanged,
          value: state.gender,
        )
      ],
    );
  }
}
