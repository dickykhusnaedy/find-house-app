import 'package:find_house_app/theme.dart';
import 'package:flutter/material.dart';

class FacilitiesWidget extends StatelessWidget {
  final String imagePath;
  final int count;
  final String type;

  const FacilitiesWidget(
      {super.key,
      required this.imagePath,
      required this.count,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          width: 32,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 8),
        Text.rich(
          TextSpan(
            text: '$count ',
            style: purpleTextStyle.copyWith(fontSize: 16, fontWeight: fontBold),
            children: <InlineSpan>[
              TextSpan(
                  text: type,
                  style: greyTextStyle.copyWith(
                      fontSize: 14, fontWeight: fontLight)),
            ],
          ),
        ),
      ],
    );
  }
}
