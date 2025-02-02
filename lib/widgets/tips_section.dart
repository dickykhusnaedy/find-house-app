import 'package:find_house_app/theme.dart';
import 'package:flutter/material.dart';

class TipsSection extends StatelessWidget {
  final int id;
  final String imagePath;
  final String title;
  final String updatedAt;

  const TipsSection(
      {super.key,
      required this.id,
      required this.imagePath,
      required this.title,
      required this.updatedAt});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(imagePath, width: 80),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: blackTextStyle.copyWith(
                    fontSize: 18, fontWeight: fontBold)),
            Text(
              'Updated $updatedAt',
              style:
                  greyTextStyle.copyWith(fontSize: 14, fontWeight: fontLight),
            )
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(50),
          child: Icon(Icons.chevron_right),
        )
      ],
    );
  }
}
