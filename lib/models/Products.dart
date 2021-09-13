class Products {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final String descrption;
  bool isfavorite;

  Products(
      {required this.id,
      required this.descrption,
      required this.imageUrl,
      this.isfavorite = false,
      required this.price,
      required this.title});
}