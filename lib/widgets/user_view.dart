import 'package:flutter/material.dart';
import 'package:git_api/global_methods/url_utils.dart';
import 'package:git_api/models/const_objects.dart';
import 'package:git_api/models/strings.dart';
import 'package:git_api/models/user.dart';
import 'package:git_api/pages/repositories_page.dart';

class UserView extends StatelessWidget {
  const UserView(this.receivedUser, {Key? key}) : super(key: key);
  final User receivedUser;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ConstObjects.paddingRightLeft,
      child: ListTile(
          shape: ConstObjects.dataDisplayBorder,
          title: Text(receivedUser.name),
          subtitle: Text(
              '${AppStrings.userDisplaySubtitle} ${receivedUser.publicRepositories}'),
          trailing: PopupMenuButton(
            onSelected: (value) {
              value == AppStrings.repositoriesPageTitle
                  ? _navigateToReposPage(receivedUser.url, context)
                  : UrlUtils.launchLink(receivedUser.link);
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                    value: AppStrings.repositoriesPageTitle,
                    child: Text(AppStrings.repositoriesPageTitle)),
                ConstObjects.webSitePopupMenuItem,
              ];
            },
          )),
    );
  }

  void _navigateToReposPage(String userName, BuildContext context) {
    final route =
        MaterialPageRoute(builder: (context) => RepositoriesPage(userName));
    Navigator.push(context, route);
  }
}
