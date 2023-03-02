import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_api/models/const_objects.dart';
import 'package:git_api/models/repositories.dart';
import 'package:git_api/pages/commits_page.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
part 'repositories_state.dart';

class RepositoriesCubit extends Cubit<RepositoriesState> {
  final String url;
  RepositoriesCubit(this.url) : super(const RepositoriesInitial()) {
    fetchRepositories(url);
  }

  Future<void> fetchRepositories(String url) async {
    emit(const RepositoriesLoading());
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final responseBody = response.body;
    if (response.statusCode == 200) {
      Iterable l = json.decode(responseBody);
      List<Repositories> receivedRepositories =
          List<Repositories>.from(l.map((model) {
        return Repositories.fromJson(model);
      }));
      emit(RepositoriesLoaded(receivedRepositories));
    } else {
      emit(const RepositoriesError());
    }
  }

  Future<void> launchLink(String link) async {
    final uri = Uri.parse(link);
    if (!await launchUrl(uri)) {
      throw Exception('${ConstObjects.exception} $uri');
    }
  }

  void navigateToCommitsPage(String userName, BuildContext context) {
    final route =
        MaterialPageRoute(builder: (context) => CommitsPage(userName));
    Navigator.push(context, route);
  }
}