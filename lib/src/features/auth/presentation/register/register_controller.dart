import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/features/applications.dart';
import 'package:myflix/src/features/domain.dart';
import 'package:myflix/src/features/presentations.dart';
import 'package:myflix/src/shared/extensions/date_time.dart';

class RegisterController extends StateNotifier<RegisterState> {
  final AuthService _authService;
  RegisterController(this._authService) : super(const RegisterState());

  final usernameController = TextEditingController();
  final birthdateController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> register() async {
    state = state.copyWith(registerValue: const AsyncLoading());

    final requestRegister = RequestRegister(
      email: emailController.text,
      password: passwordController.text,
      username: usernameController.text,
      birthdate: birthdateController.text,
      gender: state.gender ?? -1,
    );

    final result = await _authService.register(requestRegister);

    result.when(
      success: (data) {
        state = state.copyWith(registerValue: AsyncData(data));
      },
      failure: (error, stackTrace) {
        state = state.copyWith(registerValue: AsyncError(error, stackTrace));
      },
    );
  }

  void onObscureTap() {
    state = state.copyWith(
      isObscure: !state.isObscure,
    );
  }

  void onBirthdatePick(DateTime? pickDate) {
    if (pickDate != null) {
      birthdateController.text = pickDate.toYyyyMmDd;
      state = state.copyWith(
        birthDate: pickDate,
      );
    }
  }

  void onGenderChanged(int? gender) {
    state = state.copyWith(gender: gender);
  }

  @override
  void dispose() {
    usernameController.dispose();
    birthdateController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

final registerControllerProvider =
    StateNotifierProvider.autoDispose<RegisterController, RegisterState>((ref) {
  final authService = ref.read(authServiceProvider);
  return RegisterController(authService);
});
