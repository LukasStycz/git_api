import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:git_api/models/commits.dart';
import 'package:git_api/models/const_objects.dart';
import 'package:git_api/pages/commits_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

part 'commits_state.dart';

class CommitsCubit extends Cubit<CommitsState> {
  final String url;
  CommitsCubit(this.url) : super(const CommitsInitial()) {
    fetchCommits(url);
  }
  Future<void> fetchCommits(String url) async {
    emit(const CommitsLoading());
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final responseBody = response.body;
    if (response.statusCode == 200) {
      Iterable l = json.decode(responseBody);
      List<Commits> receivedCommits = List<Commits>.from(l.map((model) {
        return Commits.fromJson(model);
      }));
      emit(CommitsLoaded(
        receivedCommits,
      ));
    } else {
      emit(const CommitsError());
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
