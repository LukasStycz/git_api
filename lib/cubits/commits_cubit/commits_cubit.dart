import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:git_api/models/commits.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

part 'commits_state.dart';
part 'commits_cubit.freezed.dart';

class CommitsCubit extends Cubit<CommitsState> {
  final String url;
  CommitsCubit(this.url) : super(const CommitsState.initial()) {
    fetchCommits(url);
  }
  Future<void> fetchCommits(String url) async {
    emit(const CommitsState.loading());
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final responseBody = response.body;
    if (response.statusCode == 200) {
      final Iterable decoded = json.decode(responseBody);
      List<Commits> receivedCommits = List<Commits>.from(decoded.map((model) {
        return Commits.fromJson(model);
      }));
      emit(CommitsState.loaded(
        receivedCommits,
      ));
    } else {
      emit(const CommitsState.error());
    }
  }
}
