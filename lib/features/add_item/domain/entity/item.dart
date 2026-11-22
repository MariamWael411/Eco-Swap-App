class Item {
  static String collectionName = 'Items';
  String? itemId;
  String userId;
  String title;
  String description;
  int categoryIndex;
  int conditionIndex;

  double longitude;
  double latitude;
  String imageUrl;
  DateTime date;
  int statusIndex;

  Item({
    required this.categoryIndex,
    required this.conditionIndex,
    required this.description,
    required this.title,
    required this.latitude,
    required this.longitude,

    this.itemId,
    required this.userId,
    required this.imageUrl,
    required this.date,
    required this.statusIndex
  });

  Item copyWith({
    String? itemId,
    String? userId,
    String? title,
    String? description,
    int? categoryIndex,
    int? condionIndex,

    double? longitude,
    double? latitude,
    String? imageUrl,
    DateTime? date,
    int? statusIndex,
  }) {
    return Item(
      itemId: itemId ?? this.itemId,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      categoryIndex: categoryIndex ?? this.categoryIndex,
      conditionIndex: condionIndex ?? this.conditionIndex,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      imageUrl: imageUrl ?? this.imageUrl,
      date: date ?? this.date,
      statusIndex: statusIndex ?? this.statusIndex,
    );
  }

}
