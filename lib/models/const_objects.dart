import 'package:flutter/material.dart';
import 'package:git_api/models/colors.dart';
import 'package:git_api/models/dimens_dart.dart';
import 'package:git_api/models/strings.dart';

abstract class ConstObjects {
  static const EdgeInsets paddingAll = EdgeInsets.fromLTRB(
    Dimens.small,
    Dimens.grand,
    Dimens.small,
    Dimens.big,
  );
  static const EdgeInsets paddingTopBottom = EdgeInsets.only(
    top: Dimens.normal,
    bottom: Dimens.normal,
  );
  static const EdgeInsets paddingRightLeft = EdgeInsets.only(
    left: Dimens.small,
    right: Dimens.small,
  );
  static const EdgeInsets paddingLeftRightBottom = EdgeInsets.only(
    left: Dimens.small,
    right: Dimens.small,
    bottom: Dimens.big,
  );
  static const EdgeInsets paddingLeftRightTop = EdgeInsets.only(
    left: Dimens.small,
    top: Dimens.big,
    right: Dimens.small,
  );
  static const BorderRadius borderRadiusAll =
      BorderRadius.all(Radius.circular(Dimens.normal));
  static const SizedBox sizedBoxMicro = SizedBox(height: Dimens.micro);
  static const Center circularProgressIndicator =
      Center(child: CircularProgressIndicator());
  static const PopupMenuItem webSitePopupMenuItem =
      PopupMenuItem(value: AppStrings.webSide, child: Text(AppStrings.webSide));
  static const RoundedRectangleBorder dataDisplayBorder =
      RoundedRectangleBorder(
    side: BorderSide(
      color: AppColors.white,
      width: Dimens.mini,
    ),
    borderRadius: borderRadiusAll,
  );
}
