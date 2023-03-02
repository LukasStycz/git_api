import 'package:flutter/material.dart';
import 'package:git_api/cubits/user_cubit/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_api/models/const_objects.dart';
import 'package:git_api/models/user.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final TextEditingController userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(ConstObjects.homePageTitle),
        ),
      ),
      body: ListView(
        children: [
          textField(),
          elevatedButton(context),
          BlocBuilder<UserCubit, UserState>(builder: (
            BuildContext context,
            UserState state,
          ) {
            return state is UserLoaded
                ? showUser(state.receivedUser, context)
                : state is UserLoading
                    ? ConstObjects.circularProgressIndicator
                    : state is UserError
                        ? ConstObjects.errorMessage
                        : ConstObjects.sizedBoxMicro;
          })
        ],
      ),
    );
  }

  Widget textField() {
    return Padding(
      padding: ConstObjects.paddingAll,
      child: TextField(
          controller: userName,
          decoration: const InputDecoration(
              hintText: ConstObjects.findUserTextFieldHintText,
              border: OutlineInputBorder(
                  borderRadius: ConstObjects.borderRadiusAll))),
    );
  }

  Widget elevatedButton(BuildContext context) {
    return Padding(
      padding: ConstObjects.paddingLeftRightBottom,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: ConstObjects.borderRadiusAll,
          ),
        ),
        onPressed: () {
          context.read<UserCubit>().fetchUser(userName.text);
        },
        child: const Padding(
          padding: ConstObjects.paddingTopBottom,
          child: Text(ConstObjects.findUserButtonName),
        ),
      ),
    );
  }

  Widget showUser(User receivedUser, BuildContext context) {
    return Padding(
      padding: ConstObjects.paddingRightLeft,
      child: ListTile(
          shape: ConstObjects.dataDisplayBorder,
          title: Text(receivedUser.name),
          subtitle: Text(
              '${ConstObjects.userDisplaySubtitle} ${receivedUser.publicRepositories}'),
          trailing: PopupMenuButton(
            onSelected: (value) {
              value == ConstObjects.repositoriesPageTitle
                  ? context
                      .read<UserCubit>()
                      .navigateToReposPage(receivedUser.url, context)
                  : context.read<UserCubit>().launchLink(receivedUser.link);
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                    value: ConstObjects.repositoriesPageTitle,
                    child: Text(ConstObjects.repositoriesPageTitle)),
                ConstObjects.webSitePopupMenuItem,
              ];
            },
          )),
    );
  }
}
