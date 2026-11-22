import 'package:cloud_firestore/cloud_firestore.dart';

class ItemDto {
  static String collectionName = 'Items';
  String itemId;
  String userId;
  String title;
  String description;
  int categoryIndex;
  int condionIndex;
  double longitude;
  double latitude;
  String imageUrl;
  DateTime date;
  int statusIndex;

  ItemDto({
    required this.statusIndex,
    required this.categoryIndex,
    required this.condionIndex,
    required this.description,
    required this.title,
    required this.latitude,
    required this.longitude,
    required this.itemId,
    required this.userId,
    required this.imageUrl,
    required this.date
  });

  Map<String, dynamic> toJson() {
    return {
      'id': itemId,
      'user_id': userId,
      'title': title,
      'description': description,
      'category': categoryIndex,
      'condition': condionIndex,
      'longitude': longitude,
      'latitude': latitude,
      'image': imageUrl,
      'date': date,
      'status_index': statusIndex
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
        longitude: _toDouble(data['longitude']),
        latitude: _toDouble(data['latitude']),
        imageUrl: data['image']?.toString() ?? '',
    date: (data['date'] as Timestamp).toDate(),
      statusIndex: _toInt(data['status_index'])
      );


  static int _toInt(dynamic v) => int.tryParse(v?.toString() ?? '') ?? 0;

  static double _toDouble(dynamic v) =>
      double.tryParse(v?.toString() ?? '') ?? 0.0;
}
