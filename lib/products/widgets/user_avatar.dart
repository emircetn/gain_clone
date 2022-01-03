import 'package:flutter/material.dart';
import 'package:gain_clone/constants/color_constants.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/managers/user_manager.dart';
import 'package:provider/provider.dart';

//TODO:Fotoğraf ekleyebilme özelliği eklenecek
class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserManager>(
      builder: (context, userManager, _) {
        return Center(
          child: Stack(
            children: [
              CircleAvatar(
                backgroundColor: ColorConstants.secondaryColor,
                radius: 30.sp,
                child: Text(
                  userManager.user!.shortNameAndSurname,
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
      },
    );
  }
}
