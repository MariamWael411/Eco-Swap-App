import 'package:eco_swap_app/core/utils/firebase_utils.dart';
import 'package:eco_swap_app/features/add_item/data/data_source/remote/item_remote_data_source.dart';
import 'package:eco_swap_app/features/network/model/item_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ItemRemoteDataSource)
class ItemRemoteDataSourceImpl implements ItemRemoteDataSource {
  @override
  Future<void> addItem(ItemDto item) async {
    await FirebaseUtils.addItemInFireStore(item);
  }

  @override
  Stream<List<ItemDto>> getAllItems() {
    return FirebaseUtils.getAllItems();
  }

  @override
  Stream<List<ItemDto>> getFilterItems(int selectedIndex) {
    return FirebaseUtils.getFilterItems(selectedIndex: selectedIndex);
  }

  @override
  Future<void> updateItem(ItemDto item) async {
    await FirebaseUtils.updateItem(item);
  }

  @override
  Future<void> deleItem(ItemDto item) async {
    await FirebaseUtils.deleItem(item);
  }
}
