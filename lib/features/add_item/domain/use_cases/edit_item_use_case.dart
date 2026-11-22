import 'package:injectable/injectable.dart';

import '../entity/item.dart';
import '../repository/item_repository.dart';

@lazySingleton
class EditItemUseCase {
  ItemRepository _itemRepository;

  EditItemUseCase({required this._itemRepository});

  Future<void> call(Item item) async {
    await _itemRepository.updateItem(item);
  }
}
