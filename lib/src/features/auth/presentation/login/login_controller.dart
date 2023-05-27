import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/features/applications.dart';
import 'package:myflix/src/features/domain.dart';
import 'package:myflix/src/features/presentations.dart';

class LoginController extends StateNotifier<LoginState> {
  final AuthService _authService;
  LoginController(this._authService) : super(const LoginState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    state = state.copyWith(
      loginValue: const AsyncLoading(),
    );

    final requestLogin = RequestLogin(
      email: emailController.text,
      password: passwordController.text,
    );

    final result = await _authService.login(requestLogin);

    result.when(
      success: (data) {
        state = state.copyWith(
          loginValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          loginValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

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
  final authService = ref.read(authServiceProvider);
  return LoginController(authService);
});
