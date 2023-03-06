import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_api/cubits/commits_cubit/commits_cubit.dart';
import 'package:git_api/models/const_objects.dart';
import 'package:git_api/models/strings.dart';
import 'package:git_api/widgets/commits_view.dart';
import 'package:git_api/widgets/error_message.dart';

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
            child: Text(AppStrings.commitsPageTitle),
          ),
        ),
        body: BlocBuilder<CommitsCubit, CommitsState>(builder: (
          BuildContext context,
          CommitsState state,
        ) {
          return state is CommitsLoaded
              ? CommitsView(state.receivedCommits)
              : state is CommitsLoading
                  ? ConstObjects.circularProgressIndicator
                  : state is CommitsError
                      ? const ErrorMessage()
                      : ConstObjects.sizedBoxMicro;
        }),
      ),
    );
  }
}
