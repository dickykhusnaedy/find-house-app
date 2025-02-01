import 'package:flutter/material.dart';
import 'package:find_house_app/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: edge),
        child: ListView(
          padding: EdgeInsets.only(left: edge),
          children: [
            Text('Explore Now',
                style: blackTextStyle.copyWith(
                    fontSize: 24, fontWeight: fontMedium)),
            const SizedBox(height: 2),
            Text('Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(
                    fontSize: 16, fontWeight: fontLight)),
          ],
        ),
      )),
    );
  }
}
