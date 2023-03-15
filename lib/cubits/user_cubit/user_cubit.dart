import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_api/models/strings.dart';
import 'package:git_api/models/user.dart';
import 'package:http/http.dart' as http;

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState.initial());

  Future<void> fetchUser(String userName) async {
    emit(const UserState.loading());
    final url = '${AppStrings.fetchUserUrl}$userName';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final responseBody = response.body;
    if (response.statusCode == 200) {
      User receivedUser = User.fromJson(jsonDecode(responseBody));
      emit(UserState.loaded(receivedUser));
    } else {
      emit(const UserState.error());
    }
  }
}
