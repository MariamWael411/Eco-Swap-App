import '../../../../network/model/request_dto.dart';

abstract class RequestRemoteDataSource {
  Stream<List<RequestDto>> getAllRequest();

  Future<void> addRequestInFireStore(RequestDto request);

  Future<void> deleteRequest(RequestDto request);

  Future<void> updateRequest(RequestDto request);
}
