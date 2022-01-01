import 'package:flutter/material.dart';
import 'package:gain_clone/init/navigation/navigation_service.dart';

class AppBarLeadingButton extends IconButton {
  AppBarLeadingButton({Key? key})
      : super(
            key: key,
            icon: const Icon(Icons.arrow_back),
            onPressed: () => NavigationService.pop());
}
