import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/features/presentations.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(const LoginState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void onObsecureTap() {
    state = state.copyWith(
      isObscure: !state.isObscure,
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

final loginControllerProvider =
    StateNotifierProvider.autoDispose<LoginController, LoginState>((ref) {
  return LoginController();
});
