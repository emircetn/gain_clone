import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/dowloads/downloads_view_model.dart';
import 'package:provider/provider.dart';

class DowloadsPage extends StatelessWidget {
  const DowloadsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DownloadsViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('İndirilenler'),
        ),
        body: Center(
          child: Text(
            'Henüz indirilen bir içerik bulunmamaktadır.',
            style: context.textTheme.caption!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
