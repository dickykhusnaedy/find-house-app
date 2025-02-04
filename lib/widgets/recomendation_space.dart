import 'package:find_house_app/models/recomendation_space_model.dart';
import 'package:find_house_app/pages/detail_page.dart';
import 'package:find_house_app/theme.dart';
import 'package:flutter/material.dart';

class RecomendationSpace extends StatelessWidget {
  final RecomendationSpaceModel data;

  const RecomendationSpace({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailPage(data: data);
        }));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: SizedBox(
              width: 130,
              height: 110,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.network(
                    data.imageUrl!,
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icon_star.png',
                              width: 18, height: 18),
                          const SizedBox(width: 2),
                          Text(
                            '${data.rating!}/5',
                            style: whiteTextStyle.copyWith(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name!,
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: fontBold),
              ),
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
                            fontSize: 14, fontWeight: fontLight)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '${data.city!}, ${data.country!}',
                style:
                    greyTextStyle.copyWith(fontSize: 14, fontWeight: fontLight),
              ),
            ],
          )
        ],
      ),
    );
  }
}
