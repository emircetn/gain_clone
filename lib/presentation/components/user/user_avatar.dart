import 'package:flutter/material.dart';
import 'package:gain_clone/constants/color_constants.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/models/user.dart';

//TODO:Fotoğraf ekleyebilme özelliği eklenecek
class UserAvatar extends StatelessWidget {
  final User user;
  const UserAvatar({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: ColorConstants.primaryColor,
            radius: 30.sp,
            child: Text(
              user.shortNameAndSurname,
              style: context.textTheme.headline6,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                size: 20.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
