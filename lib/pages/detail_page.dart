import 'package:find_house_app/theme.dart';
import 'package:find_house_app/widgets/facilities_widget.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan tinggi status bar
    double statusBarHeight = MediaQuery.of(context).padding.top;

    List<String> photos = [
      'assets/photo1.png',
      'assets/photo2.png',
      'assets/photo3.png'
    ];

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/thumbnail.png',
            width: MediaQuery.of(context).size.width,
            height: 450,
            fit: BoxFit.cover,
          ),
          ListView(
            children: [
              const SizedBox(
                height: 355,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    color: whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text('Main Facilities',
                            style: blackTextStyle.copyWith(fontSize: 16))),
                    const SizedBox(height: 12),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FacilitiesWidget(
                            imagePath: 'assets/icon_kitchen.png',
                            count: 2,
                            type: 'kitchen',
                          ),
                          FacilitiesWidget(
                            imagePath: 'assets/icon_bedroom.png',
                            count: 3,
                            type: 'bedroom',
                          ),
                          FacilitiesWidget(
                            imagePath: 'assets/icon_cupboard.png',
                            count: 3,
                            type: 'big lemari',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text('Photos',
                            style: blackTextStyle.copyWith(fontSize: 16))),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 88,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: photos.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(width: 18),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              left: index == 0 ? edge : 0, // Space awal
                              right: index == photos.length - 1
                                  ? edge
                                  : 0, // Space akhir
                            ),
                            child: Image.asset(photos[index],
                                width: 110, height: 88, fit: BoxFit.cover),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text('Location',
                            style: blackTextStyle.copyWith(fontSize: 16))),
                    const SizedBox(height: 6),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Jln. Kappan Sukses No. 20\nPalembang',
                              style: greyTextStyle.copyWith(fontSize: 14)),
                          InkWell(
                            onTap: () {
                              print('object2');
                            },
                            child: Image.asset(
                              'assets/btn_map.png',
                              width: 40,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
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
                            onPressed: () {},
                            child: Text('Book Now',
                                style: whiteTextStyle.copyWith(fontSize: 18))),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: statusBarHeight + edge, left: edge, right: edge),
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
        ],
      ),
    );
  }
}
