class Item {
  static String collectionName = 'Items';
  String? itemId;
  String userId;
  String title;
  String description;
  int categoryIndex;
  int conditionIndex;
  String status;
  double longitude;
  double latitude;
  String imageUrl;
  DateTime date;

  Item({
    required this.categoryIndex,
    required this.conditionIndex,
    required this.description,
    required this.title,
    required this.latitude,
    required this.longitude,
    required this.status,
    this.itemId,
    required this.userId,
    required this.imageUrl,
    required this.date
  });
}
