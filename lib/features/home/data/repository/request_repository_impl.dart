import 'package:eco_swap_app/features/home/data/data_source/remote/request_remote_data_source.dart';
import 'package:eco_swap_app/features/home/data/mapper/to_request.dart';
import 'package:eco_swap_app/features/home/domain/entities/request.dart';
import 'package:eco_swap_app/features/home/domain/repository/request_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RequestRepository)
class RequestRepositoryImpl implements RequestRepository {
  RequestRemoteDataSource _requestRemoteDataSource;

  RequestRepositoryImpl({required this._requestRemoteDataSource});

  @override
  Future<void> addRequestInFireStore(Request request) async {
    try {
      await _requestRemoteDataSource.addRequestInFireStore(
        request.toRequestDto(),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<Request>> getAllRequest() {
    try {
      return _requestRemoteDataSource.getAllRequest().map((requestsDto) {
        return requestsDto.map((requestDto) {
          return requestDto.toRequest();
        }).toList();
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteRequest(Request request) async {
    try {
      await _requestRemoteDataSource.deleteRequest(request.toRequestDto());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateRequest(Request request) async {
    try {
      await _requestRemoteDataSource.updateRequest(request.toRequestDto());
    } catch (e) {
      rethrow;
    }
  }
}
