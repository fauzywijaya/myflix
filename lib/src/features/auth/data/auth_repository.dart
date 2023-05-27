// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/exceptions/network_exceptions.dart';
import 'package:myflix/src/features/data.dart';
import 'package:myflix/src/features/domain.dart';
import 'package:myflix/src/services/services.dart';

class AuthRepository {
  final DioClient _dioClient;
  AuthRepository(
    this._dioClient,
  );

  Future<Result<LoginResponse>> login(RequestLogin requestLogin) async {
    try {
      final response = await _dioClient.post(
        Endpoint.login,
        data: requestLogin.toJson(),
      );

      return Result.success(LoginResponse.fromJson(response['data']));
    } catch (e, stackTrace) {
      return Result.failure(NetworkExceptions.getDioExceptions(e), stackTrace);
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dioClient = ref.read(dioClientProvider);
  return AuthRepository(dioClient);
});
