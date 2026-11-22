import 'package:eco_swap_app/features/home/domain/repository/request_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/request.dart';

@lazySingleton
class GetRequestUseCase {
  RequestRepository _requestRepository;

  GetRequestUseCase({required this._requestRepository});

  Stream<List<Request>> call() {
    return _requestRepository.getAllRequest();
  }
}
