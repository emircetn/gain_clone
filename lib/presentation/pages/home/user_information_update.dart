import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/models/arguments/user_information_update_page_arguments.dart';
import 'package:gain_clone/presentation/components/button/app_async_button.dart';
import 'package:gain_clone/presentation/components/button/appbar_leading_button.dart';
import 'package:gain_clone/presentation/components/textformfield/app_text_form_field.dart';
import 'package:gain_clone/utils/app_functions.dart';

class UserInformationUpdatePage extends StatelessWidget {
  static const String path = '/userInformationUpdate';

  final UserInformationUpdatePageArguments args;

  const UserInformationUpdatePage({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(args.text),
        leading: AppBarLeadingButton(),
      ),
      body: Padding(
        padding: context.paddingHorizontal8x,
        child: Column(
          children: [
            SizedBox(height: 12.sp),
            AppTextFormField(context: context),
            SizedBox(height: 12.sp),
            AppAsyncButton(
              text: args.text,
              futureFunction: args.buttonCallBack,
            )
          ],
        ),
      ),
    );
  }
}
