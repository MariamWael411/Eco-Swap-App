import '../../../../network/model/item_dto.dart';
import '../../../../network/model/my_user_dto.dart';

abstract class ItemRemoteDataSource {
  Future<void> addItem(ItemDto item);

  Stream<List<ItemDto>> getAllItems();

  Stream<List<ItemDto>> getFilterItems(int selectedIndex);

  Future<void> updateItem(ItemDto item);

  Future<void> deleItem(ItemDto item);

  Future<void> updateItemInUser(MyUserDto user);
}
