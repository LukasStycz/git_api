import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_api/cubits/commits_cubit/commits_cubit.dart';
import 'package:git_api/models/commits.dart';
import 'package:git_api/models/const_objects.dart';
import 'package:git_api/models/strings.dart';

class CommitsView extends StatelessWidget {
  const CommitsView(this.receivedCommits,{Key? key}) : super(key: key);
final List<Commits> receivedCommits;
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: receivedCommits.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: ConstObjects.paddingLeftRightTop,
            child: ListTile(
              shape: ConstObjects.dataDisplayBorder,
              title: Text(receivedCommits[index].name),
              subtitle: Text(
                  '${AppStrings.repositoriesAndCommitsDisplaySubtitle} ${receivedCommits[index].date}'),
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
