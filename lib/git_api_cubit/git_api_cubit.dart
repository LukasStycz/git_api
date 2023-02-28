import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_api/models/commits.dart';
import 'package:git_api/models/repositories.dart';
import 'package:git_api/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

part 'git_api_state.dart';

class GitApiCubit extends Cubit<GitApiState> {
  List<dynamic> receivedData = [];

  GitApiCubit() : super(const GitApiInitial(initialList));

  Future<void> fetchData(String url, bool fromButton) async {
    print(url);
    print(receivedData);
    if (url == '') {
      emit(const GitApiInitial(initialList));
    } else {
      emit(GitApiLoading(receivedData));
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final responseBody = response.body;
      if (response.statusCode == 200) {
        if ((receivedData is List<User> || receivedData is List<Commits>) &&
            fromButton == false) {
          Iterable l = json.decode(response.body);
          receivedData = List<Repositories>.from(l.map((model) {
            return Repositories.fromJson(model);
          }));
          emit(GitApiRepositories(receivedData as List<Repositories>));
        } else if (receivedData is List<Repositories> && fromButton == false) {
          Iterable l = json.decode(response.body);
          receivedData = List<Commits>.from(l.map((model) {
            return Commits.fromJson(model);
          }));
          emit(GitApiCommits(receivedData as List<Commits>));
        } else {
          List<User> user = [User.fromJson(jsonDecode(responseBody))];
          receivedData = user;
          emit(GitApiUser(receivedData as List<User>));
        }
      } else {
        emit(const GitApiInitial(initialList));
        print('błąd urzytkownika');
      }
    }
  }

  Future<void> launchLink(String link) async {
    final uri = Uri.parse(link);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}

const List<int> initialList = [1];
