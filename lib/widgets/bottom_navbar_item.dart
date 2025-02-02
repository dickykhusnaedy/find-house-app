import 'package:find_house_app/theme.dart';
import 'package:flutter/material.dart';

class BottomNavbarItem extends StatelessWidget {
  final String imagePath;
  final bool isActive;

  const BottomNavbarItem(
      {super.key, required this.imagePath, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset(imagePath, width: 26),
        const Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(1000))),
              )
            : Container()
      ],
    );
  }
}
