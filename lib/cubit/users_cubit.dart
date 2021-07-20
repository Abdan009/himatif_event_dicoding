import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:himatif_event_info/models/models.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());

  Future<void> getUser() async {
    Users result = mockUser[0];
    emit(UsersLoaded(result));
  }

  Future<void> login(String email, String password) async {
    Users result = mockUser[0];
    emit(UsersLoaded(result));
  }

  Future<void> register(Users user, String password,
      {File photoProfile}) async {
    Users result = mockUser[0];
    emit(UsersLoaded(result));
  }

  Future<void> logout() async {
    emit(UsersLoaded(null));
  }
}
