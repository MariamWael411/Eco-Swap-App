import 'package:eco_swap_app/features/add_item/domain/repository/item_repository.dart';
import 'package:injectable/injectable.dart';

import '../entity/item.dart';

@lazySingleton
class AddItemUseCase {
  ItemRepository _itemRepository;

  AddItemUseCase({required this._itemRepository});

  Future<void> call(Item item) async {
    await _itemRepository.addItem(item);
  }
}
