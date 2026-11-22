import 'package:eco_swap_app/features/add_item/data/data_source/remote/item_remote_data_source.dart';
import 'package:eco_swap_app/features/add_item/data/mapper/to_item.dart';
import 'package:eco_swap_app/features/add_item/data/mapper/to_user_dto.dart';
import 'package:eco_swap_app/features/add_item/domain/repository/item_repository.dart';
import 'package:eco_swap_app/features/auth/domain/entities/my_user.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/item.dart';

@Injectable(as: ItemRepository)
class ItemRepositoryImpl implements ItemRepository {
  ItemRemoteDataSource _itemRemoteDataSource;

  ItemRepositoryImpl({required this._itemRemoteDataSource});

  @override
  Future<void> addItem(Item item) async {
    try {
      await _itemRemoteDataSource.addItem(item.toItemDto());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<Item>> getAllItems() {
    try {
      return _itemRemoteDataSource.getAllItems().map((itemsDto) {
        return itemsDto.map((itemDto) {
          return itemDto.toItem();
        }).toList();
      });
    } catch (e, stackTrace) {
      rethrow;
    }
  }

  @override
  Stream<List<Item>> getFilterItem(int selectedIndex) {
    try {
      return _itemRemoteDataSource.getFilterItems(selectedIndex).map((
        itemsDto,
      ) {
        return itemsDto.map((itemDto) {
          return itemDto.toItem();
        }).toList();
      });
    } catch (e, stackTrace) {
      rethrow;
    }
  }

  @override
  Future<void> updateItem(Item item) async {
    try {
      await _itemRemoteDataSource.updateItem(item.toItemDto());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleItem(Item item) async {
    try {
      await _itemRemoteDataSource.deleItem(item.toItemDto());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateItemInUser(MyUser user) async {
    try {
      await _itemRemoteDataSource.updateItemInUser(user.toUserDto());
    } catch (e) {
      rethrow;
    }
  }
}
