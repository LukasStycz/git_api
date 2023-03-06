import 'package:flutter/material.dart';
import 'package:git_api/models/const_objects.dart';
import 'package:git_api/models/strings.dart';
class UserNameInsertTextField extends StatelessWidget {
  const UserNameInsertTextField(this.userName,{Key? key}) : super(key: key);
  final TextEditingController userName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ConstObjects.paddingAll,
      child: TextField(
          controller: userName,
          decoration: const InputDecoration(
              hintText: AppStrings.findUserTextFieldHintText,
              border: OutlineInputBorder(
                  borderRadius: ConstObjects.borderRadiusAll))),
    );
  }
}
