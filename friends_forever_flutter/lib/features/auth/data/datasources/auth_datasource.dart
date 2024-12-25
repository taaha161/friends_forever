import 'dart:async';

import 'package:friends_forever_client/friends_forever_client.dart';
import 'package:friends_forever_flutter/core/errors/exceptions.dart';
import 'package:friends_forever_flutter/features/user/data/models/user_model.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

abstract interface class AuthDatasource {
  Future<UserModel?> currentUser();

  Future<UserModel?> loginWithEmailPassword(
      {required String email, required String password});

  Future<bool?> registerWithEmailPassword(
      {required String username,
      required String email,
      required String password});

  Future<UserModel> emailVerification(
      {required String email, required String code});

  Future<void> logout();
}

class AuthDataSourceImpl implements AuthDatasource {
  final SessionManager sessionManager;
  final Client client;

  AuthDataSourceImpl({required this.sessionManager, required this.client});
  @override
  Future<UserModel?> currentUser() async {
    try {
      if (!sessionManager.isSignedIn) return null;

      final user = await client.user.get();
      if (user == null ||
          user.id == null ||
          user.userInfo == null ||
          user.inviteCode == null ||
          user.userInfo!.email == null ||
          user.userInfo!.userName == null) {
        return throw ServerpodException("User not found");
      }

      return UserModel(
          id: user.id!,
          email: user.userInfo!.email!,
          username: user.userInfo!.userName!,
          inviteCode: user.inviteCode!.code);
    } catch (e) {
      throw ServerpodException(e.toString());
    }
  }

  @override
  Future<UserModel> emailVerification(
      {required String email, required String code}) async {
    try {
      final result = await client.modules.auth.email.createAccount(email, code);
      if (result == null) throw ServerpodException("Invalid verification code");
      final user = await client.user.verifyEmail(result);

      if (user == null ||
          user.id == null ||
          user.userInfo == null ||
          user.inviteCode == null ||
          user.userInfo!.email == null ||
          user.userInfo!.userName == null) {
        return throw ServerpodException("User wasnt created properly");
      }

      return UserModel(
          id: user.id!,
          email: user.userInfo!.email!,
          username: user.userInfo!.userName!,
          inviteCode: user.inviteCode!.code);
    } catch (e) {
      throw ServerpodException(e.toString());
    }
  }

  @override
  Future<UserModel?> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final result =
          await client.modules.auth.email.authenticate(email, password);

      if (!result.success) throw ServerpodException(result.failReason!.name);

      sessionManager.registerSignedInUser(
          result.userInfo!, result.keyId!, result.key!);
      final user = await client.user.get();
      if (user == null ||
          user.id == null ||
          user.userInfo == null ||
          user.inviteCode == null ||
          user.userInfo!.email == null ||
          user.userInfo!.userName == null) {
        return throw ServerpodException("User wasnt created properly");
      }

      return UserModel(
          id: user.id!,
          email: user.userInfo!.email!,
          username: user.userInfo!.userName!,
          inviteCode: user.inviteCode!.code);
    } catch (e) {
      throw ServerpodException(e.toString());
    }
  }

  @override
  Future<bool> logout() async {
    try {
      return await sessionManager.signOutDevice();
    } catch (e) {
      throw ServerpodException(e.toString());
    }
  }

  @override
  Future<bool?> registerWithEmailPassword(
      {required String username,
      required String email,
      required String password}) async {
    try {
      return await client.modules.auth.email
          .createAccountRequest(username, email, password);
    } catch (e) {
      throw ServerpodException(e.toString());
    }
  }
}
