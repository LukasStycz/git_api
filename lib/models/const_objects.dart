import 'package:flutter/material.dart';
import 'package:git_api/models/dimens_dart.dart';

abstract class ConstObjects {
  static const String errorMessageText = 'Failed to Load Data';
  static const String webSide = 'WebSite';
  static const String findUserButtonName = 'Find User';
  static const String findUserTextFieldHintText = 'Write User Name';
  static const String repositoriesAndCommitsDisplaySubtitle = 'Created at:';
  static const String userDisplaySubtitle = 'Public Repos:';
  static const String exception = 'Could not launch';
  static const String homePageTitle = 'Find User';
  static const String repositoriesPageTitle = 'Repositories';
  static const String commitsPageTitle = 'Commits';
  static const String fetchUserUrl = 'https://api.github.com/users/';
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
  static const Color white = Colors.white;
  static const BorderRadius borderRadiusAll =
      BorderRadius.all(Radius.circular(Dimens.normal));
  static const SizedBox sizedBoxMicro = SizedBox(height: Dimens.micro);
  static const Center circularProgressIndicator =
      Center(child: CircularProgressIndicator());
  static const PopupMenuItem webSitePopupMenuItem =
      PopupMenuItem(value: webSide, child: Text(webSide));
  static const RoundedRectangleBorder dataDisplayBorder =
      RoundedRectangleBorder(
    side: BorderSide(
      color: white,
      width: Dimens.mini,
    ),
    borderRadius: borderRadiusAll,
  );
  static const Padding errorMessage = Padding(
    padding: paddingLeftRightTop,
    child: ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: white,
          width: Dimens.mini,
        ),
        borderRadius: borderRadiusAll,
      ),
      title: Text(
        errorMessageText,
        style: TextStyle(color: white),
      ),
      tileColor: Colors.red,
    ),
  );
}
