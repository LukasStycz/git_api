import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_api/models/strings.dart';
import 'package:git_api/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserInitial());

  Future<void> fetchUser(String userName) async {
    emit(const UserLoading());
    final url = '${AppStrings.fetchUserUrl}$userName';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final responseBody = response.body;
    if (response.statusCode == 200) {
      User receivedUser = User.fromJson(jsonDecode(responseBody));
      emit(UserLoaded(receivedUser));
    } else {
      emit(const UserError());
    }
  }

  Future<void> launchLink(String link) async {
    final uri = Uri.parse(link);
    if (!await launchUrl(uri)) {
      throw Exception('${AppStrings.exception} $uri');
    }
  }
}
