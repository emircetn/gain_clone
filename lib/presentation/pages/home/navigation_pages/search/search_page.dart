import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/presentation/components/textformfield/search_text_form_field.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/search/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchViewModel(),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: ListView(
            padding: context.paddingHorizontal16x,
            children: [
              SizedBox(height: 12.sp),
              SearchTextFormField(
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
