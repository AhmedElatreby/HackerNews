import '../models/item_model.dart';

abstract class Cache {
  Future<int> addItem(ItemModel itemModel);
  Future<int> clear();
}
