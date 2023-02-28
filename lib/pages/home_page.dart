import 'package:flutter/material.dart';
import 'package:git_api/git_api_cubit/git_api_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GitApiCubit, GitApiState>(builder: (
      BuildContext context,
      GitApiState state,
    ) {
      return interfaceScreen(state, context);
    });
  }
}

Widget interfaceScreen(state, BuildContext context) {
  final List<dynamic> receivedData = state.receivedData;
  final TextEditingController userName = TextEditingController();
  final bool repositoriesOrCommits =
      state is GitApiRepositories || state is GitApiCommits;
  return Scaffold(
    appBar: state is GitApiLoading
        ? null
        : AppBar(
            leading: repositoriesOrCommits
                ? FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Colors.grey.shade800,
                    foregroundColor: Colors.white,
                    child: const Icon(Icons.arrow_back),
                    onPressed: () {
                      context.read<GitApiCubit>().fetchData('', false);
                    })
                : null,
            title: state is GitApiRepositories
                ? const Text('Repositories')
                : state is GitApiCommits
                    ? const Text('Commits')
                    : const Text('Find User'),
          ),
    body: state is GitApiLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: receivedData.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  repositoriesOrCommits
                      ? const SizedBox(
                          height: 1,
                        )
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(8, 40, 8, 20),
                          child: TextField(
                              controller: userName,
                              decoration: const InputDecoration(
                                  hintText: 'Write User Name',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))))),
                        ),
                  repositoriesOrCommits
                      ? const SizedBox(
                          height: 1,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, bottom: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<GitApiCubit>().fetchData(
                                  'https://api.github.com/users/${userName.text}',
                                  true);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(top: 12, bottom: 12),
                              child: Text('Find User'),
                            ),
                          ),
                        ),
                  state is GitApiInitial
                      ? const SizedBox(
                          height: 1,
                        )
                      : Padding(
                          padding:
                              const EdgeInsets.only(left: 8, top: 20, right: 8),
                          child: ListTile(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            title: Text(receivedData[index].name),
                            subtitle: Text(state is GitApiUser
                                ? 'Public Repositories ${receivedData[index].publicRepositories}'
                                : 'Created at: ${receivedData[index].date}'),
                            trailing: PopupMenuButton(
                              onSelected: (value) {
                                value == 'Fetch Data'
                                    ? context.read<GitApiCubit>().fetchData(
                                        receivedData[index].url, false)
                                    : context
                                        .read<GitApiCubit>()
                                        .launchLink(receivedData[index].link);
                              },
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                      value: 'Fetch Data',
                                      child: state is GitApiUser
                                          ? const Text('Repositories')
                                          : state is GitApiRepositories
                                              ? const Text('Commits')
                                              : const Text(
                                                  'Back to Repositories')),
                                  const PopupMenuItem(
                                      value: 'WebSite', child: Text('WebSite')),
                                ];
                              },
                            ),
                          ),
                        )
                ],
              );
            }),
  );
}
