import 'package:find_house_app/models/city_categories_model.dart';
import 'package:find_house_app/models/recomendation_space_model.dart';
import 'package:find_house_app/models/tips_model.dart';
import 'package:find_house_app/widgets/bottom_navbar_item.dart';
import 'package:find_house_app/widgets/city_categories.dart';
import 'package:find_house_app/widgets/recomendation_space.dart';
import 'package:find_house_app/widgets/tips_section.dart';
import 'package:flutter/material.dart';
import 'package:find_house_app/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CityCategoriesModels> cityCategories = [];
  List<RecomendationSpaceModel> recomendation = [];
  List<TipsModel> tips = [];

  void _getData() {
    cityCategories = CityCategoriesModels.getCategories();
    recomendation = RecomendationSpaceModel.getRecomendation();
    tips = TipsModel.getTips();
  }

  @override
  Widget build(BuildContext context) {
    _getData();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 30),
            Padding(
                padding: EdgeInsets.only(left: edge),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Explore Now',
                          style: blackTextStyle.copyWith(
                              fontSize: 24, fontWeight: fontBold)),
                      const SizedBox(height: 2),
                      Text('Mencari kosan yang cozy',
                          style: greyTextStyle.copyWith(
                              fontSize: 16, fontWeight: fontLight)),
                    ])),
            const SizedBox(height: 30),
            Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text('Popular Cities',
                    style: blackTextStyle.copyWith(fontSize: 16))),
            const SizedBox(height: 16),
            SizedBox(
              height: 150,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? 24 : 0, // Space awal
                        right: index == cityCategories.length - 1
                            ? 24
                            : 0, // Space akhir
                      ),
                      child: CityCategories(
                        id: cityCategories[index].id,
                        imagePath: cityCategories[index].imagePath,
                        title: cityCategories[index].title,
                        isPopular: cityCategories[index].isPopular,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(width: 20),
                  itemCount: cityCategories.length),
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: edge),
                    child: Text('Recommended Space',
                        style: blackTextStyle.copyWith(fontSize: 16))),
                const SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: edge),
                  child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return RecomendationSpace(
                          id: recomendation[index].id,
                          imagePath: recomendation[index].imagePath,
                          title: recomendation[index].title,
                          price: recomendation[index].price,
                          location: recomendation[index].location,
                          rate: recomendation[index].rate,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 20),
                      itemCount: recomendation.length),
                )
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: edge),
                    child: Text('Tips & Guidance',
                        style: blackTextStyle.copyWith(fontSize: 16))),
                const SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: edge),
                  child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return TipsSection(
                          id: tips[index].id,
                          imagePath: tips[index].imagePath,
                          title: tips[index].title,
                          updatedAt: tips[index].updatedAt,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 20),
                      itemCount: tips.length),
                )
              ],
            ),
            SizedBox(height: 80 + edge),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imagePath: 'assets/icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imagePath: 'assets/icon_email.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imagePath: 'assets/icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imagePath: 'assets/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
