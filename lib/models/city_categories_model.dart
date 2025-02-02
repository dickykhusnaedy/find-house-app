class CityCategoriesModels {
  int id;
  String imagePath;
  String title;
  bool isPopular;

  CityCategoriesModels(
      {required this.id,
      required this.imagePath,
      required this.title,
      required this.isPopular});

  static List<CityCategoriesModels> getCategories() {
    List<CityCategoriesModels> cityCategories = [];

    cityCategories.add(CityCategoriesModels(
        id: 1,
        imagePath: 'assets/city1.png',
        title: 'Jakarta',
        isPopular: false));
    cityCategories.add(CityCategoriesModels(
        id: 2,
        imagePath: 'assets/city2.png',
        title: 'Bandung',
        isPopular: true));
    cityCategories.add(CityCategoriesModels(
        id: 3,
        imagePath: 'assets/city3.png',
        title: 'Surabaya',
        isPopular: false));
    cityCategories.add(CityCategoriesModels(
        id: 3,
        imagePath: 'assets/city3.png',
        title: 'Surabaya',
        isPopular: true));

    return cityCategories;
  }
}
