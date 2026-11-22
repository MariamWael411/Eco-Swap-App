import 'package:eco_swap_app/features/home/domain/entities/request.dart';

import '../../../../../utils/resource.dart';

class RequestStates {
  late Resource<List<Request>> requestStates;
  String? action;

  RequestStates({required this.requestStates, this.action});

  RequestStates.initial() {
    requestStates = Resource.initial();
    action = null;
  }
}
