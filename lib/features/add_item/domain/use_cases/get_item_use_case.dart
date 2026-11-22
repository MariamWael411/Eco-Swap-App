import 'package:eco_swap_app/features/add_item/domain/repository/item_repository.dart';
import 'package:injectable/injectable.dart';

import '../entity/item.dart';

@lazySingleton
class GetItemUseCase {
  ItemRepository _itemRepository;

  GetItemUseCase({required this._itemRepository});

  Stream<List<Item>> call() {
    return _itemRepository.getAllItems();
  }
}
