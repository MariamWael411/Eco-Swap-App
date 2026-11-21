import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_swap_app/features/add_item/domain/use_cases/add_item_use_case.dart';
import 'package:eco_swap_app/features/add_item/domain/use_cases/delete_item_use_case.dart';
import 'package:eco_swap_app/features/add_item/domain/use_cases/edit_item_use_case.dart';
import 'package:eco_swap_app/features/add_item/domain/use_cases/get_filter_item_use_case.dart';
import 'package:eco_swap_app/features/add_item/domain/use_cases/get_item_use_case.dart';
import 'package:eco_swap_app/features/add_item/ui/cubit/item_states.dart';
import 'package:eco_swap_app/features/utils/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/location_service.dart';
import '../../domain/entity/item.dart';

@injectable
class ItemCubit extends Cubit<ItemStates> {
  AddItemUseCase _addItemUseCase;
  GetItemUseCase _getItemUseCase;
  GetFilterItemUseCase _getFilterItemUseCase;
  EditItemUseCase _editItemUseCase;
  DeleteItemUseCase _deleteItemUseCase;

  final LocationService _locationService = LocationService();

  ItemCubit({
    required this._deleteItemUseCase,
    required this._addItemUseCase,
    required this._editItemUseCase,
    required this._getItemUseCase,
    required this._getFilterItemUseCase,
  }) : super(ItemStates.initial());

  StreamSubscription? _itemsSub;

  Future<void> addItem(Item item) async {
    try {
      emit(
        ItemStates(
          itemStates: Resource.loading(),
          currentPosition: state.currentPosition,
        ),
      );

      await _addItemUseCase(item);

      emit(
        ItemStates(
          itemStates: Resource.success(data: null),
          currentPosition: state.currentPosition,
        ),
      );
    } catch (e) {
      emit(
        ItemStates(
          itemStates: Resource.error(errorMessage: e.toString()),
          currentPosition: state.currentPosition,
        ),
      );
    }
  }

  Future<void> getItem() async {
    emit(
      ItemStates(
        itemStates: Resource.loading(),
        currentPosition: state.currentPosition,
      ),
    );

    await _itemsSub?.cancel();

    _itemsSub = _getItemUseCase().listen(
      (items) {
        emit(
          ItemStates(
            itemStates: Resource.success(data: items),
            currentPosition: state.currentPosition,
          ),
        );
      },
      onError: (e, stackTrace) {
        debugPrint('GET ITEM ERROR: $e');

        emit(
          ItemStates(
            itemStates: Resource.error(errorMessage: e.toString()),
            currentPosition: state.currentPosition,
          ),
        );
      },
    );
  }

  Future<void> getFilterItem(int selectedIndex) async {
    emit(
      ItemStates(
        itemStates: Resource.loading(),
        currentPosition: state.currentPosition,
      ),
    );

    await _itemsSub?.cancel();

    _itemsSub = _getFilterItemUseCase(selectedIndex).listen(
      (items) {
        emit(
          ItemStates(
            itemStates: Resource.success(data: items),
            currentPosition: state.currentPosition,
          ),
        );
      },
      onError: (e, stackTrace) {
        debugPrint('GET ITEM ERROR: $e');

        emit(
          ItemStates(
            itemStates: Resource.error(errorMessage: e.toString()),
            currentPosition: state.currentPosition,
          ),
        );
      },
    );
  }

  Future<void> getUserLocation() async {
    try {
      final position = await _locationService.getCurrentLocation();

      emit(ItemStates(itemStates: state.itemStates, currentPosition: position));
    } catch (e) {
      debugPrint('GET LOCATION ERROR: $e');
      emit(ItemStates(itemStates: state.itemStates, currentPosition: null));
    }
  }

  @override
  Future<void> close() {
    _itemsSub?.cancel();
    return super.close();
  }

  Future<void> editItem(Item item) async {
    try {
      emit(ItemStates(itemStates: Resource.loading()));
      await _editItemUseCase(item);
      emit(ItemStates(itemStates: Resource.success(data: null)));
    } catch (e) {
      emit(ItemStates(itemStates: Resource.error(errorMessage: e.toString())));
    }
  }

  Future<void> deleteItem(Item item) async {
    try {
      emit(ItemStates(itemStates: Resource.loading()));
      await _deleteItemUseCase(item);
      emit(ItemStates(itemStates: Resource.success(data: null)));
    } catch (e) {
      emit(ItemStates(itemStates: Resource.error(errorMessage: e.toString())));
    }
  }
}
