import 'package:eco_swap_app/features/add_item/domain/entity/item.dart';
import 'package:eco_swap_app/features/utils/resource.dart';
import 'package:geolocator/geolocator.dart';

class ItemStates {
  final Resource<List<Item>> itemStates;
  final Position? currentPosition;
  final String? action;

  ItemStates({
    required this.itemStates,
    this.currentPosition,
    this.action,
  });

  ItemStates.initial()
      : itemStates = Resource.initial(),
        currentPosition = null,
        action = null;
}
