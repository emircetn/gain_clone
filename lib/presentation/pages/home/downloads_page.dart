import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';

class DowloadsPage extends StatelessWidget {
  const DowloadsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
