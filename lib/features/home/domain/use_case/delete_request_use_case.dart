import 'package:eco_swap_app/features/home/domain/repository/request_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/request.dart';

@lazySingleton
class DeleteRequestUseCase {
  RequestRepository _requestRepository;

  DeleteRequestUseCase({required this._requestRepository});

  Future<void> call(Request request) async {
    await _requestRepository.deleteRequest(request);
  }
}
