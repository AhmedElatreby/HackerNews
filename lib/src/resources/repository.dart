import 'dart:async';
import 'package:news/src/resources/cache.dart';
import 'package:news/src/resources/source.dart';

import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';

class Repository {
  List<Source> sources = <Source>[
    newsDbProvider,
    NewApiProvider(),
  ];

  List<Cache> caches = <Cache>[
    newsDbProvider,
  ];

  // Iterate over sources when dbProvider
  // get fetchTopIds implemented
  Future<List<int>> fetchTopIds() {
    return sources[1].fetchTopIds();
  }

  Future<ItemModel?> fetchItem(int id) async {
    ItemModel? itemModel; // Initialize item to null
    var source;

    for (source in sources) {
      itemModel = await source.fetchItem(id);
      if (itemModel != null) {
        break;
      }
    }

    if (itemModel != null) {
      for (var cache in caches) {
        if (cache != source) {
          cache.addItem(itemModel);
        }
      }
    }

    return itemModel!;
  }

  clearCache() async {
    for (var cache in caches) {
      await cache.clear();
    }
  }
}
