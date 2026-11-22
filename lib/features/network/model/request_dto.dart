import 'package:cloud_firestore/cloud_firestore.dart';

class RequestDto {
  static String collectionName = 'Requests';
  String? requestId;
  String itemId;
  String senderId;
  String receiverId;
  DateTime createdAt;
  int statusIndex;

  RequestDto({
    this.requestId,
    required this.itemId,
    required this.senderId,
    required this.receiverId,

    required this.createdAt,
    required this.statusIndex,
  });

  Map<String, dynamic> toJson() {
    return {
      'request_id': requestId,
      'item_id': itemId,
      'sender_id': senderId,
      'receiver_id': receiverId,

      'created_at': createdAt,
      'status_index': statusIndex,
    };
  }

  RequestDto.fromJson(Map<String, dynamic> data)
    : this(
        itemId: data['item_id'],
        createdAt: (data['created_at'] as Timestamp).toDate(),
        receiverId: data['receiver_id'],
        senderId: data['sender_id'],
        requestId: data['request_id'],
        statusIndex: data['status_index'],
      );
}
