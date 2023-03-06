import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_api/cubits/repositories_cubit/repositories_cubit.dart';
import 'package:git_api/models/const_objects.dart';
import 'package:git_api/models/strings.dart';
import 'package:git_api/widgets/error_message.dart';
import 'package:git_api/widgets/repositories_view.dart';

class RepositoriesPage extends StatelessWidget {
  final String url;
  const RepositoriesPage(this.url, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RepositoriesCubit>(
      create: (context) => RepositoriesCubit(url),
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(AppStrings.repositoriesPageTitle),
          ),
        ),
        body: BlocBuilder<RepositoriesCubit, RepositoriesState>(builder: (
          BuildContext context,
          RepositoriesState state,
        ) {
          return state is RepositoriesLoaded
              ? RepositoriesView(state.receivedRepositories)
              : state is RepositoriesLoading
                  ? ConstObjects.circularProgressIndicator
                  : state is RepositoriesError
                      ? const ErrorMessage()
                      : ConstObjects.sizedBoxMicro;
        }),
      ),
    );
  }
}
