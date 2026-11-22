import 'package:eco_swap_app/features/home/domain/entities/request.dart';
import 'package:eco_swap_app/features/network/model/request_dto.dart';

extension ToRequestDto on Request {
  RequestDto toRequestDto() {
    return RequestDto(
      statusIndex: statusIndex,
      itemId: itemId,
      senderId: senderId,
      receiverId: receiverId,

      createdAt: createdAt,
      requestId: requestId,
    );
  }
}

extension ToRequest on RequestDto {
  Request toRequest() {
    return Request(
      statusIndex: statusIndex,
      itemId: itemId,
      senderId: senderId,
      receiverId: receiverId,

      createdAt: createdAt,
      requestId: requestId,
    );
  }
}
