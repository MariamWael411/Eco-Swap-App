import '../entities/request.dart';

abstract class RequestRepository {
  Future<void> addRequestInFireStore(Request request);

  Stream<List<Request>> getAllRequest();

  Future<void> deleteRequest(Request request);

  Future<void> updateRequest(Request request);
}
