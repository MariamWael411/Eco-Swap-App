import 'package:cloud_firestore/cloud_firestore.dart';

class Request {
  static String collectionName = 'Requests';
  String? requestId;
  String itemId;
  String senderId;
  String receiverId;

  DateTime createdAt;
  int statusIndex;

  Request({
    this.requestId,
    required this.itemId,
    required this.senderId,
    required this.receiverId,

    required this.createdAt,
    required this.statusIndex,
  });

  Request copyWith({
    String? requestId,
    String? itemId,
    String? senderId,
    String? receiverId,

    DateTime? createdAt,
    int? statusIndex,
  }) {
    return Request(
      requestId: requestId ?? this.requestId,
      itemId: itemId ?? this.itemId,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      createdAt: createdAt ?? this.createdAt,
      statusIndex: statusIndex ?? this.statusIndex,
    );
  }
}
