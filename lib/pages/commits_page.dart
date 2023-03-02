import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_api/cubits/commits_cubit/commits_cubit.dart';
import 'package:git_api/models/const_objects.dart';
import 'package:git_api/models/commits.dart';

class CommitsPage extends StatelessWidget {
  final String url;
  const CommitsPage(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommitsCubit>(
      create: (context) => CommitsCubit(url),
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(ConstObjects.commitsPageTitle),
          ),
        ),
        body: BlocBuilder<CommitsCubit, CommitsState>(builder: (
          BuildContext context,
          CommitsState state,
        ) {
          return state is CommitsLoaded
              ? showCommits(state.receivedCommits, context)
              : state is CommitsLoading
                  ? ConstObjects.circularProgressIndicator
                  : state is CommitsError
                      ? ConstObjects.errorMessage
                      : ConstObjects.sizedBoxMicro;
        }),
      ),
    );
  }

  Widget showCommits(List<Commits> receivedCommits, BuildContext context) {
    return ListView.builder(
        itemCount: receivedCommits.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: ConstObjects.paddingLeftRightTop,
            child: ListTile(
              shape: ConstObjects.dataDisplayBorder,
              title: Text(receivedCommits[index].name),
              subtitle: Text(
                  '${ConstObjects.repositoriesAndCommitsDisplaySubtitle} ${receivedCommits[index].date}'),
              trailing: PopupMenuButton(
                onSelected: (value) {
                  context
                      .read<CommitsCubit>()
                      .launchLink(receivedCommits[index].link);
                },
                itemBuilder: (context) {
                  return [
                    ConstObjects.webSitePopupMenuItem,
                  ];
                },
              ),
            ),
          );
        });
  }
}
