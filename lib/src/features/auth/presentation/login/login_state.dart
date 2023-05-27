// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginState {
  final bool isObscure;
  final AsyncValue<String?> loginValue;
  const LoginState({
    this.loginValue = const AsyncData(null),
    this.isObscure = true,
  });

  bool get isLoading => loginValue.isLoading;

  LoginState copyWith({
    bool? isObscure,
    AsyncValue<String?>? loginValue,
  }) {
    return LoginState(
      isObscure: isObscure ?? this.isObscure,
      loginValue: loginValue ?? this.loginValue,
    );
  }
}
