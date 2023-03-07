import 'package:flutter/material.dart';
import 'package:git_api/models/colors.dart';
import 'package:git_api/models/const_objects.dart';
import 'package:git_api/models/dimens_dart.dart';
import 'package:git_api/models/strings.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: ConstObjects.paddingLeftRightTop,
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.white,
            width: Dimens.mini,
          ),
          borderRadius: ConstObjects.borderRadiusAll,
        ),
        title: Text(
          AppStrings.errorMessageText,
          style: TextStyle(color: AppColors.white),
        ),
        tileColor: AppColors.red,
      ),
    );
  }
}
