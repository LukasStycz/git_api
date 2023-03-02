import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_api/models/commits.dart';
import 'package:git_api/models/const_objects.dart';
import 'package:git_api/models/repositories.dart';
import 'package:git_api/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

part 'git_api_state.dart';

class GitApiCubit extends Cubit<GitApiState> {
  List<dynamic> receivedData = [];
  List<Repositories> repositoriesNeededForBackButtonFromCommitsScreen = [];
  GitApiCubit()
      : super(const GitApiInitial(
          ConstObjects.initialReceivedDataList,
          ConstObjects.initialRepositoriesList,
          ConstObjects.errorMessageNotNeeded,
        ));

  Future<void> launchLink(String link) async {
    final uri = Uri.parse(link);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  Future<void> fetchData(String url, bool fromButton) async {
    emit(GitApiLoading(
      receivedData,
      repositoriesNeededForBackButtonFromCommitsScreen,
      ConstObjects.errorMessageNotNeeded,
    ));
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final responseBody = response.body;
    if (response.statusCode == 200) {
      _fetchUser(responseBody, fromButton);
    } else {
      backToInitialPage(
        ConstObjects.errorMessageNeeded,
      );
    }
  }

  Future<void> _fetchUser(responseBody, bool fromButton) async {
    if (fromButton) {
      List<User> user = [User.fromJson(jsonDecode(responseBody))];
      receivedData = user;
      emit(GitApiUser(
        receivedData as List<User>,
        repositoriesNeededForBackButtonFromCommitsScreen,
        ConstObjects.errorMessageNotNeeded,
      ));
    } else {
      _fetchReposOrCommits(responseBody);
    }
  }

  Future<void> _fetchReposOrCommits(responseBody) async {
    Iterable l = json.decode(responseBody);
    if (receivedData is List<Repositories>) {
      repositoriesNeededForBackButtonFromCommitsScreen =
          receivedData as List<Repositories>;
      receivedData = List<Commits>.from(l.map((model) {
        return Commits.fromJson(model);
      }));
      emit(GitApiCommits(
        receivedData as List<Commits>,
        repositoriesNeededForBackButtonFromCommitsScreen,
        ConstObjects.errorMessageNotNeeded,
      ));
    } else {
      receivedData = List<Repositories>.from(l.map((model) {
        return Repositories.fromJson(model);
      }));
      emit(GitApiRepositories(
        receivedData as List<Repositories>,
        repositoriesNeededForBackButtonFromCommitsScreen,
        ConstObjects.errorMessageNotNeeded,
      ));
    }
  }

  void backToInitialPage(bool errorMessageNeed) {
    emit(GitApiInitial(
      ConstObjects.initialReceivedDataList,
      ConstObjects.initialRepositoriesList,
      errorMessageNeed,
    ));
  }

  void backToRepositoriesPage() {
    emit(GitApiRepositories(
      repositoriesNeededForBackButtonFromCommitsScreen,
      repositoriesNeededForBackButtonFromCommitsScreen,
      ConstObjects.errorMessageNotNeeded,
    ));
  }
}
