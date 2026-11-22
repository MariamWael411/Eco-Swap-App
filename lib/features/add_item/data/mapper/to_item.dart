import 'package:eco_swap_app/features/add_item/domain/entity/item.dart';
import 'package:eco_swap_app/features/network/model/item_dto.dart';

extension ToItemDto on Item {
  ItemDto toItemDto() {
    return ItemDto(
      categoryIndex: categoryIndex,
      condionIndex: conditionIndex,
      description: description,
      title: title,
      latitude: latitude,
      longitude: longitude,
      status: status,
      itemId: itemId ?? "",
      userId: userId,
      imageUrl: imageUrl,
        date: date
    );
  }
}

extension ToItem on ItemDto {
  Item toItem() {
    return Item(
      categoryIndex: categoryIndex,
      conditionIndex: condionIndex,
      description: description,
      title: title,
      latitude: latitude,
      longitude: longitude,
      status: status,
      itemId: itemId,
      userId: userId,
      imageUrl: imageUrl,
        date: date
    );
  }
}
