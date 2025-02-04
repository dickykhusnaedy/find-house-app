import 'package:find_house_app/models/recomendation_space_model.dart';
import 'package:find_house_app/pages/error_page.dart';
import 'package:find_house_app/theme.dart';
import 'package:find_house_app/widgets/facilities_widget.dart';
import 'package:find_house_app/widgets/rating_item.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final RecomendationSpaceModel data;

  const DetailPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan tinggi status bar
    double statusBarHeight = MediaQuery.of(context).padding.top;

    Future<void> showUrl(Uri url) async {
      if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ErrorPage();
        }));
      }
    }

    Future<void> makePhoneCall(String phoneNumber) async {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    }

    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            data.imageUrl!,
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
                              Text(data.name!,
                                  style: blackTextStyle.copyWith(
                                      fontSize: 22, fontWeight: fontBold)),
                              const SizedBox(height: 2),
                              Text.rich(
                                TextSpan(
                                  text: '\$${data.price!} ',
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
                            children: [1, 2, 3, 4, 5].map((index) {
                              return Container(
                                margin: EdgeInsets.only(left: 2),
                                child: RatingItem(
                                    index: index, rating: data.rating!),
                              );
                            }).toList(),
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
                            count: data.numberOfKitchens!,
                            type: 'kitchen',
                          ),
                          FacilitiesWidget(
                            imagePath: 'assets/icon_bedroom.png',
                            count: data.numberOfBedrooms!,
                            type: 'bedroom',
                          ),
                          FacilitiesWidget(
                            imagePath: 'assets/icon_cupboard.png',
                            count: data.numberOfCupboards!,
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
                        itemCount: data.photos!.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(width: 18),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              left: index == 0 ? edge : 0, // Space awal
                              right: index == data.photos!.length - 1
                                  ? edge
                                  : 0, // Space akhir
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(data.photos![index],
                                  width: 110, height: 88, fit: BoxFit.cover),
                            ),
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
                          Text('${data.address!}\n${data.city!}',
                              style: greyTextStyle.copyWith(fontSize: 14)),
                          InkWell(
                            onTap: () {
                              showUrl(Uri.parse(data.mapUrl!));
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
                            onPressed: () {
                              makePhoneCall(data.phone!);
                            },
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
