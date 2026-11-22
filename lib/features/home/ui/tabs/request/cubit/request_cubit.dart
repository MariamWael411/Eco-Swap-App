import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_swap_app/features/home/domain/use_case/add_request_use_case.dart';
import 'package:eco_swap_app/features/home/domain/use_case/delete_request_use_case.dart';
import 'package:eco_swap_app/features/home/domain/use_case/get_request_use_case.dart';
import 'package:eco_swap_app/features/home/domain/use_case/update_request_use_case.dart';
import 'package:eco_swap_app/features/home/ui/tabs/request/cubit/request_states.dart';
import 'package:eco_swap_app/features/utils/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/request.dart';

@injectable
class RequestCubit extends Cubit<RequestStates> {
  AddRequestUseCase _addRequestUseCase;
  GetRequestUseCase _getRequestUseCase;
  StreamSubscription? _itemsSub;
  DeleteRequestUseCase _deleteRequestUseCase;
  UpdateRequestUseCase _updateRequestUseCase;

  RequestCubit({
    required this._getRequestUseCase,
    required this._addRequestUseCase,
    required this._deleteRequestUseCase,
    required this._updateRequestUseCase,
  }) : super(RequestStates.initial());
  List<Request> requests = [];

  Future<void> addRequest(Request request) async {
    try {
      emit(RequestStates(requestStates: Resource.loading()));
      await _addRequestUseCase(request);
      emit(
        RequestStates(
          requestStates: Resource.success(data: null),
          action: 'add_request',
        ),
      );
    } catch (e) {
      emit(
        RequestStates(
          requestStates: Resource.error(errorMessage: e.toString()),
          action: 'add_request',
        ),
      );
    }
  }

  Future<void> getRequest() async {
    emit(RequestStates(requestStates: Resource.loading()));

    await _itemsSub?.cancel();

    _itemsSub = _getRequestUseCase().listen(
      (request) {
        requests = request;
        emit(RequestStates(requestStates: Resource.success(data: request)));
      },
      onError: (e, stackTrace) {
        debugPrint('GET Request ERROR: $e');

        emit(
          RequestStates(
            requestStates: Resource.error(errorMessage: e.toString()),
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _itemsSub?.cancel();
    return super.close();
  }

  Future<void> deleteRequest(Request request) async {
    try {
      await _deleteRequestUseCase(request);
      emit(RequestStates(requestStates: Resource.success(data: null)));
    } catch (e) {
      emit(
        RequestStates(
          requestStates: Resource.error(errorMessage: e.toString()),
        ),
      );
    }
  }

  bool isAccepted(bool isAccept) {
    return isAccept;
  }

  Future<void> updateRequest(Request request, {required String action}) async {
    try {
      await _updateRequestUseCase(request);

      emit(
        RequestStates(
          requestStates: Resource.success(data: null),
          action: action,
        ),
      );
    } catch (e) {
      emit(
        RequestStates(
          requestStates: Resource.error(errorMessage: e.toString()),
          action: action,
        ),
      );
    }
  }

  Request? getAcceptedRequest({
    required String itemId,
    required String senderId,
    required String receiverId,
  }) {
    try {
      return requests.firstWhere(
        (request) =>
            request.itemId == itemId &&
            request.senderId == senderId &&
            request.receiverId == receiverId &&
            request.statusIndex == 0,
      );
    } catch (e) {
      return null;
    }
  }
}
