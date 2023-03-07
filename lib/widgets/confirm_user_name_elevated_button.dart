import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_api/cubits/user_cubit/user_cubit.dart';
import 'package:git_api/models/const_objects.dart';
import 'package:git_api/models/strings.dart';

class ConfirmUserNameElevatedButton extends StatelessWidget {
  const ConfirmUserNameElevatedButton(this.userName, {Key? key})
      : super(key: key);
  final TextEditingController userName;
  @override
  Widget build(BuildContext context) {
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
          child: Text(AppStrings.findUserButtonName),
        ),
      ),
    );
  }
}
