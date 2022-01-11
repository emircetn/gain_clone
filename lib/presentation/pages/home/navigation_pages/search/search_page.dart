import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/arguments/player_page_arguments.dart';
import 'package:gain_clone/data/models/content.dart';
import 'package:gain_clone/data/models/content_part.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/init/navigation/navigation_service.dart';
import 'package:gain_clone/presentation/components/indicators/app_linear_progress_indicator.dart';
import 'package:gain_clone/presentation/components/items/content_list_item.dart';
import 'package:gain_clone/presentation/components/items/content_part_mini_item.dart';
import 'package:gain_clone/presentation/components/textformfield/search_text_form_field.dart';
import 'package:gain_clone/presentation/pages/home/content/content_page.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/search/search_view_model.dart';
import 'package:gain_clone/presentation/pages/home/player/player_page.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  void pushContentPage(BuildContext context, {required Content content}) {
    NavigationService.pushWithModalBottomSheet(
      context,
      ContentPage(content: content),
    );
  }

  void pushPlayerPage({required ContentPart contentPart}) {
    NavigationService.pushNamed(
      PlayerPage.path,
      arguments: PlayerPageArguments(
        content: Content.temp(), //TODO:eklenecek
        partList: [contentPart],
        selectedContentIndex: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchViewModel(),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child:
              Consumer<SearchViewModel>(builder: (context, searchViewModel, _) {
            return ListView(
              padding: context.paddingHorizontal16x,
              children: [
                SizedBox(height: 12.sp),
                SearchTextFormField(
                  context: context,
                  onChanged: searchViewModel.searchContent,
                  onFieldSubmitted: searchViewModel.searchContent,
                ),
                SizedBox(height: 24.sp),
                if (searchViewModel.isLoading)
                  const AppLinearProgressIndicator()
                else if (searchViewModel.isInitialState)
                  showPopulerContentParts(
                      context, searchViewModel.popularContentParts)
                else if (searchViewModel.foundedContents == null ||
                    searchViewModel.foundedContents!.isEmpty)
                  showNotFoundContentText(context, searchViewModel.searchText)
                else
                  showFoundContents(context, searchViewModel.foundedContents!)
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget showPopulerContentParts(
      BuildContext context, List<ContentPart>? popularContentParts) {
    if (popularContentParts == null || popularContentParts.isEmpty) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'En çok izlenenler',
          style: context.textTheme.headline6,
        ),
        SizedBox(height: 24.sp),
        ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 24.sp),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: popularContentParts.length,
          itemBuilder: (_, index) {
            return ContentPartMiniItem(
              contentPart: popularContentParts[index],
              onTap: () => pushPlayerPage(
                contentPart: popularContentParts[index],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget showNotFoundContentText(BuildContext context, String searchText) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '"$searchText"',
            style: context.textTheme.bodyText1,
          ),
          TextSpan(
            text: ' ile iligli bir sonuç bulunamadı',
            style: context.textTheme.bodyText1!.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget showFoundContents(BuildContext context, List<Content> contentList) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 24.sp,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: contentList.length,
      itemBuilder: (_, index) {
        return ContentListItem(
          content: contentList[index],
          onTap: () => pushContentPage(
            context,
            content: contentList[index],
          ),
        );
      },
    );
  }
}
