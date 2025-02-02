class RecomendationSpaceModel {
  int id;
  String imagePath;
  String title;
  int price;
  String location;
  int rate;

  RecomendationSpaceModel({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.location,
    required this.rate,
  });

  static List<RecomendationSpaceModel> getRecomendation() {
    List<RecomendationSpaceModel> recomendation = [];

    recomendation.add(RecomendationSpaceModel(
        id: 1,
        imagePath: 'assets/space1.png',
        title: 'Kuretakeso Hott',
        price: 52,
        location: 'Bandung, Indonesia',
        rate: 4));
    recomendation.add(RecomendationSpaceModel(
        id: 2,
        imagePath: 'assets/space2.png',
        title: 'Roemah Nenek',
        price: 11,
        location: 'Seattle, United States',
        rate: 5));
    recomendation.add(RecomendationSpaceModel(
        id: 3,
        imagePath: 'assets/space3.png',
        title: 'Darrling How',
        price: 20,
        location: 'Jakarta, Indonesia',
        rate: 3));

    return recomendation;
  }
}
