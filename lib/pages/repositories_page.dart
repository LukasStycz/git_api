import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_api/cubits/repositories_cubit/repositories_cubit.dart';
import 'package:git_api/models/const_objects.dart';
import 'package:git_api/models/repositories.dart';

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
            child: Text(ConstObjects.repositoriesPageTitle),
          ),
        ),
        body: BlocBuilder<RepositoriesCubit, RepositoriesState>(builder: (
          BuildContext context,
          RepositoriesState state,
        ) {
          return state is RepositoriesLoaded
              ? showRepositories(state.receivedRepositories, context)
              : state is RepositoriesLoading
                  ? ConstObjects.circularProgressIndicator
                  : state is RepositoriesError
                      ? ConstObjects.errorMessage
                      : ConstObjects.sizedBoxMicro;
        }),
      ),
    );
  }

  Widget showRepositories(
      List<Repositories> receivedRepositories, BuildContext context) {
    return ListView.builder(
        itemCount: receivedRepositories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: ConstObjects.paddingLeftRightTop,
            child: ListTile(
              shape: ConstObjects.dataDisplayBorder,
              title: Text(receivedRepositories[index].name),
              subtitle: Text(
                  '${ConstObjects.repositoriesAndCommitsDisplaySubtitle} ${receivedRepositories[index].date}'),
              trailing: PopupMenuButton(
                onSelected: (value) {
                  value == ConstObjects.commitsPageTitle
                      ? context.read<RepositoriesCubit>().navigateToCommitsPage(
                          receivedRepositories[index].url, context)
                      : context
                          .read<RepositoriesCubit>()
                          .launchLink(receivedRepositories[index].link);
                },
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                        value: ConstObjects.commitsPageTitle,
                        child: Text(ConstObjects.commitsPageTitle)),
                    ConstObjects.webSitePopupMenuItem,
                  ];
                },
              ),
            ),
          );
        });
  }
}
