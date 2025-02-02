import 'package:find_house_app/theme.dart';
import 'package:flutter/material.dart';

class CityCategories extends StatelessWidget {
  final int id;
  final String imagePath;
  final String title;
  final bool isPopular;

  const CityCategories(
      {required this.imagePath,
      required this.title,
      super.key,
      required this.id,
      required this.isPopular});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        color: Color(0xffF6F7F8),
        child: Stack(children: [
          Column(children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(
                  imagePath,
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
                isPopular
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                              color: purpleColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30))),
                          child: Center(
                            child: Image.asset('assets/icon_star.png',
                                width: 20, height: 20),
                          ),
                        ),
                      )
                    : SizedBox.shrink()
              ],
            ),
            const SizedBox(height: 10),
            Text(title,
                style: blackTextStyle.copyWith(
                    fontSize: 14, fontWeight: fontMedium))
          ]),
        ]),
      ),
    );
  }
}
