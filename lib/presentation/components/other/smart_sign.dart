import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';

class SmartSign extends StatelessWidget {
  const SmartSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14.sp,
      height: 14.sp,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.grey[600]!,
            Colors.grey[800]!,
          ],
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
