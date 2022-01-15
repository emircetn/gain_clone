import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/presentation/pages/home/user_information_update/user_information_update_page_arguments.dart';
import 'package:gain_clone/presentation/components/buttons/app_async_button.dart';
import 'package:gain_clone/presentation/components/buttons/appbar_leading_button.dart';
import 'package:gain_clone/presentation/components/textformfield/app_text_form_field.dart';
import 'package:gain_clone/presentation/pages/home/user_information_update/user_information_update_view_model.dart';
import 'package:provider/provider.dart';

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
      body: ChangeNotifierProvider<UserInformationUpdateViewModel>(
        create: (context) => UserInformationUpdateViewModel(args),
        builder: (context, _) {
          return Padding(
            padding: context.paddingHorizontal8x,
            child: Column(
              children: [
                SizedBox(height: 12.sp),
                Builder(builder: (context) {
                  final userInformationUpdateViewModel =
                      context.read<UserInformationUpdateViewModel>();
                  return Form(
                    key: userInformationUpdateViewModel.formKey,
                    child: AppTextFormField(
                      controller:
                          userInformationUpdateViewModel.textEditingController,
                      context: context,
                      inputFormatters: args.inputFormatters,
                      validator: (newValue) => args.validatorFunction(newValue,
                          userInformationUpdateViewModel.currentValue),
                      onFieldSubmitted: (s) => context
                          .read<UserInformationUpdateViewModel>()
                          .updateInformation(context),
                    ),
                  );
                }),
                SizedBox(height: 12.sp),
                AppAsyncButton(
                  text: args.text,
                  futureFunction: () => context
                      .read<UserInformationUpdateViewModel>()
                      .updateInformation(context),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
