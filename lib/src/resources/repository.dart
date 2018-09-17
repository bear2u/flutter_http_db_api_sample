import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';

class Repository {
<<<<<<< HEAD
  NewsDbProvider dbProvider = NewsDbProvider();
  NewsApiProvider apiProvider = NewsApiProvider();
  NewsCacheProvider cacheProvider = 

=======
  List<Source> sources = <Source>[
    newsDbProvider,
    NewsApiProvider(),
>>>>>>> 28bc9e44984c12cd8578faa3ecbfc2ed68e093b1

  ];

  List<Cache> caches = <Cache>[
    newsDbProvider,    
  ];

  //Iterate over souces when dbprovider
  // get fetchIds
  Future<List<int>> fetchTopIds() {    
    return sources[1].fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    Source source;

    for (source in sources) {
      item = await source.fetchItem(id);
      if (item != null) {
        break;
      }
    }

    for (var cache in caches) {
      cache.addItem(item);
    }

    return item;
  }
  
}

abstract class Source {
  Future<List<int>> fetchTopIds();
  Future<ItemModel> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(ItemModel itemModel);
}