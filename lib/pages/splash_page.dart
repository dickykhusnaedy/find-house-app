import 'package:find_house_app/pages/home_page.dart';
import 'package:find_house_app/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/splash_image.png')),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo.png'))),
                    ),
                    const SizedBox(height: 30),
                    Text('Find Cozy House\nto Stay and Happy',
                        style: blackTextStyle.copyWith(
                            fontSize: 24, fontWeight: fontMedium)),
                    const SizedBox(height: 10),
                    Text(
                        'Stop membuang banyak waktu\npada tempat yang tidak habitable',
                        style: greyTextStyle.copyWith(
                            fontSize: 16, fontWeight: fontLight)),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 12),
                        backgroundColor: purpleColor,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const HomePage();
                        }));
                      },
                      child: Text(
                        'Explore Now',
                        style: TextStyle(color: whiteColor, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
