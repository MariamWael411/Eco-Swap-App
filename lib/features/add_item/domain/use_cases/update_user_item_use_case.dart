import 'package:eco_swap_app/features/add_item/domain/repository/item_repository.dart';
import 'package:eco_swap_app/features/auth/domain/entities/my_user.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateUserItemUseCase {
  ItemRepository _itemRepository;

  UpdateUserItemUseCase({required this._itemRepository});

  Future<void> call(MyUser user) {
    return _itemRepository.updateItemInUser(user);
  }
}
