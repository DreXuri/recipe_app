class ProductModel {
  final String title;
  final String id;
  final String image;
  final String date;
  final bool isLiked;

  ProductModel(
      {required this.isLiked,
      required this.id,
      required this.image,
      required this.title,
      required this.date});
}
