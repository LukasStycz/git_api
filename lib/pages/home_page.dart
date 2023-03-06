import 'package:flutter/material.dart';
import 'package:git_api/cubits/user_cubit/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_api/models/const_objects.dart';
import 'package:git_api/models/strings.dart';
import 'package:git_api/widgets/confirm_user_name_elevated_button.dart';
import 'package:git_api/widgets/user_error_message.dart';
import 'package:git_api/widgets/user_view.dart';
import 'package:git_api/widgets/username_insert_text_field.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final TextEditingController userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(AppStrings.homePageTitle),
        ),
      ),
      body: ListView(
        children: [
          UserNameInsertTextField(userName),
          ConfirmUserNameElevatedButton(userName),
          BlocBuilder<UserCubit, UserState>(builder: (
            BuildContext context,
            UserState state,
          ) {
            return state is UserLoaded
                ? UserView(state.receivedUser)
                : state is UserLoading
                    ? ConstObjects.circularProgressIndicator
                    : state is UserError
                        ? const UserErrorMessage()
                        : ConstObjects.sizedBoxMicro;
          })
        ],
      ),
    );
  }
}
