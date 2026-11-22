import 'package:injectable/injectable.dart';

import '../entity/item.dart';
import '../repository/item_repository.dart';

@lazySingleton
class DeleteItemUseCase {
  ItemRepository _itemRepository;

  DeleteItemUseCase({required this._itemRepository});

  Future<void> call(Item item) async {
    await _itemRepository.deleItem(item);
  }
}
