class ItemDto {
  static String collectionName = 'Items';
  String itemId;
  String userId;
  String title;
  String description;
  int categoryIndex;
  int condionIndex;
  String status;
  double longitude;
  double latitude;
  String imageUrl;

  ItemDto({
    required this.categoryIndex,
    required this.condionIndex,
    required this.description,
    required this.title,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.itemId,
    required this.userId,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': itemId,
      'user_id': userId,
      'title': title,
      'description': description,
      'category': categoryIndex,
      'condition': condionIndex,
      'status': status,
      'longitude': longitude,
      'latitude': latitude,
      'image': imageUrl,
    };
  }

  ItemDto.fromJson(Map<String, dynamic> data)
    : this(
        itemId: data['id']?.toString() ?? '',
        userId: data['user_id']?.toString() ?? '',
        title: data['title']?.toString() ?? '',
        description: data['description']?.toString() ?? '',
        categoryIndex: _toInt(data['category']),
        condionIndex: _toInt(data['condition']),
        status: data['status']?.toString() ?? '',
        longitude: _toDouble(data['longitude']),
        latitude: _toDouble(data['latitude']),
        imageUrl: data['image']?.toString() ?? '',
      );

  static int _toInt(dynamic v) => int.tryParse(v?.toString() ?? '') ?? 0;

  static double _toDouble(dynamic v) =>
      double.tryParse(v?.toString() ?? '') ?? 0.0;
}
