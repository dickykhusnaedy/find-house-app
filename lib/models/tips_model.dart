class TipsModel {
  int id;
  String imagePath;
  String title;
  String updatedAt;

  TipsModel(
      {required this.id,
      required this.imagePath,
      required this.title,
      required this.updatedAt});

  static List<TipsModel> getTips() {
    List<TipsModel> tips = [];

    tips.add(TipsModel(
        id: 1,
        imagePath: 'assets/tips1.png',
        title: 'City Guidelines',
        updatedAt: '20 Apr'));
    tips.add(TipsModel(
        id: 2,
        imagePath: 'assets/tips2.png',
        title: 'Jakarta Fairship',
        updatedAt: '11 Dec'));

    return tips;
  }
}
