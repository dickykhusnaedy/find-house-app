import 'package:find_house_app/theme.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan tinggi status bar
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/thumbnail.png',
            width: MediaQuery.of(context).size.width,
            height: 450,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: statusBarHeight + 10, left: edge, right: edge),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/btn_back.png',
                    width: 40,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/btn_wishlist.png',
                    width: 40,
                  ),
                ),
              ],
            ),
          ),
          ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    color: whiteColor),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Kuretakeso Hott',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 22, fontWeight: fontBold)),
                              const SizedBox(height: 2),
                              Text.rich(
                                TextSpan(
                                  text: '\$52 ',
                                  style: purpleTextStyle.copyWith(
                                      fontSize: 16, fontWeight: fontBold),
                                  children: <InlineSpan>[
                                    TextSpan(
                                        text: '/ month',
                                        style: greyTextStyle.copyWith(
                                            fontSize: 14,
                                            fontWeight: fontLight)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset('assets/icon_star.png', width: 20),
                              Image.asset('assets/icon_star.png', width: 20),
                              Image.asset('assets/icon_star.png', width: 20),
                              Image.asset('assets/icon_star.png', width: 20),
                              Image.asset(
                                'assets/icon_star.png',
                                width: 20,
                                color: Color(0xff989BA1),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
