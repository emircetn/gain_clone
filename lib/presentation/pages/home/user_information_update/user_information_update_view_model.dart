import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/arguments/user_information_update_page_arguments.dart';
import 'package:gain_clone/utils/app_functions.dart';

class UserInformationUpdateViewModel extends ChangeNotifier {
  UserInformationUpdatePageArguments args;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController textEditingController;

  late String currentValue;

  UserInformationUpdateViewModel(this.args) {
    currentValue = args.initialValue;
    textEditingController = TextEditingController(text: currentValue);
  }

  Future<void> updateInformation(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      bool result = await args.buttonCallBack(textEditingController.value.text);
      final message = result == true
          ? '${args.text} başarıyla güncellendi'
          : '${args.text} başarıyla güncellenemedi';
      AppFunctions.showSnackBar(
        context: context,
        message: message,
        isSuccess: result,
      );
      if (result == true) {
        currentValue = textEditingController.value.text;
      }
    }
  }
}
