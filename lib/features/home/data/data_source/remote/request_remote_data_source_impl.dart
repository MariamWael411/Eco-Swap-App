import 'package:eco_swap_app/core/utils/firebase_utils.dart';
import 'package:eco_swap_app/features/home/data/data_source/remote/request_remote_data_source.dart';
import 'package:eco_swap_app/features/network/model/request_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RequestRemoteDataSource)
class RequestRemoteDataSourceImpl extends RequestRemoteDataSource {
  @override
  Future<void> addRequestInFireStore(RequestDto request) async {
    await FirebaseUtils.addRequestInFireStore(request);
  }

  @override
  Stream<List<RequestDto>> getAllRequest() {
    return FirebaseUtils.getAllRequest();
  }

  @override
  Future<void> deleteRequest(RequestDto request) async {
    await FirebaseUtils.deleteRequest(request);
  }

  @override
  Future<void> updateRequest(RequestDto request) async {
    await FirebaseUtils.updateRequest(request);
  }
}
