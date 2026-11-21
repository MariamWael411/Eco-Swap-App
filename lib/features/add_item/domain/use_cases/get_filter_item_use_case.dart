import 'package:eco_swap_app/features/add_item/domain/repository/item_repository.dart';
import 'package:injectable/injectable.dart';

import '../entity/item.dart';

@lazySingleton
class GetFilterItemUseCase {
  ItemRepository _itemRepository;

  GetFilterItemUseCase({required this._itemRepository});

  Stream<List<Item>> call(int selectedIndex) {
    return _itemRepository.getFilterItem(selectedIndex);
  }
}
