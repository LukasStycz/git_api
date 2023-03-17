import 'package:flutter/material.dart';
import 'package:git_api/global_methods/url_utils.dart';
import 'package:git_api/models/const_objects.dart';
import 'package:git_api/models/repositories.dart';
import 'package:git_api/models/strings.dart';
import 'package:git_api/pages/commits_page.dart';

class RepositoriesView extends StatelessWidget {
  const RepositoriesView(this.receivedRepositories, {Key? key})
      : super(key: key);
  final List<Repositories> receivedRepositories;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: receivedRepositories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: ConstObjects.paddingLeftRightTop,
            child: ListTile(
              shape: ConstObjects.dataDisplayBorder,
              title: Text(receivedRepositories[index].name),
              subtitle: Text(
                  '${AppStrings.repositoriesAndCommitsDisplaySubtitle} ${receivedRepositories[index].date}'),
              trailing: PopupMenuButton(
                onSelected: (value) {
                  value == AppStrings.commitsPageTitle
                      ? _navigateToCommitsPage(
                          receivedRepositories[index].url,
                          context,
                        )
                      : UrlUtils.launchLink(receivedRepositories[index].link);
                },
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                        value: AppStrings.commitsPageTitle,
                        child: Text(AppStrings.commitsPageTitle)),
                    ConstObjects.webSitePopupMenuItem,
                  ];
                },
              ),
            ),
          );
        });
  }

  void _navigateToCommitsPage(String userName, BuildContext context) {
    final route =
        MaterialPageRoute(builder: (context) => CommitsPage(userName));
    Navigator.push(context, route);
  }
}
