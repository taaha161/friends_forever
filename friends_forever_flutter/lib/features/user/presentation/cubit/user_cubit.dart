import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:friends_forever_flutter/core/entities/user.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void updateUser(User? user) {
    if (user == null) {
      emit(UserInitial());
    } else {
      emit(UserLoggedIn(user));
    }
  }

  void logout() {
    emit(UserInitial());
  }
}
