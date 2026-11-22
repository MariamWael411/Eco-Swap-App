import '../../../auth/domain/entities/my_user.dart';
import '../entity/item.dart';

abstract class ItemRepository {
  Future<void> addItem(Item item);

  Stream<List<Item>> getAllItems();

  Stream<List<Item>> getFilterItem(int selectedIndex);

  Future<void> updateItem(Item item);

  Future<void> deleItem(Item item);

  Future<void> updateItemInUser(MyUser user);
}
