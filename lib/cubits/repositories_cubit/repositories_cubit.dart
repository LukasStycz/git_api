import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_api/models/repositories.dart';
import 'package:http/http.dart' as http;
part 'repositories_state.dart';
part 'repositories_cubit.freezed.dart';

class RepositoriesCubit extends Cubit<RepositoriesState> {
  final String url;
  RepositoriesCubit(this.url) : super(const RepositoriesState.initial()) {
    fetchRepositories(url);
  }

  Future<void> fetchRepositories(String url) async {
    emit(const RepositoriesState.loading());
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final responseBody = response.body;
    if (response.statusCode == 200) {
      final Iterable decoded = json.decode(responseBody);
      List<Repositories> receivedRepositories =
          List<Repositories>.from(decoded.map((model) {
        return Repositories.fromJson(model);
      }));
      emit(RepositoriesState.loaded(receivedRepositories));
    } else {
      emit(const RepositoriesState.error());
    }
  }
}
