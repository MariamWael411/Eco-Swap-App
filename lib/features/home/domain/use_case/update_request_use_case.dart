import 'package:injectable/injectable.dart';

import '../entities/request.dart';
import '../repository/request_repository.dart';

@lazySingleton
class UpdateRequestUseCase {
  RequestRepository _requestRepository;

  UpdateRequestUseCase({required this._requestRepository});

  Future<void> call(Request request) async {
    await _requestRepository.updateRequest(request);
  }
}
