import 'package:find_house_app/pages/home_page.dart';
import 'package:find_house_app/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/error.png',
                    width: MediaQuery.of(context).size.width - 100),
                const SizedBox(height: 70),
                Text(
                  'Where are you going?',
                  style: blackTextStyle.copyWith(
                      fontSize: 24, fontWeight: fontBold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: edge),
                  child: Text(
                    'Seems like the page that you were requested is already gone',
                    style: greyTextStyle.copyWith(
                        fontSize: 16, fontWeight: fontLight),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: edge),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 12),
                          backgroundColor: purpleColor,
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }), (route) => false);
                        },
                        child: Text('Back to Home',
                            style: whiteTextStyle.copyWith(fontSize: 18))),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
