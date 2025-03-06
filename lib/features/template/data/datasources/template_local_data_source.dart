import 'dart:convert';
import 'package:consulto/core/database/cache/cache_helper.dart';
import 'package:consulto/core/errors/exceptions.dart';
import '../models/template_model.dart';

class TemplateLocalDataSource {
  final CacheHelper cache;
  final String key = "CachedTemplate";
  TemplateLocalDataSource({required this.cache});

  // cacheTemplate(TemplateModel? templateToCache) {
  //   if (templateToCache != null) {
  //     cache.saveData(
  //       key: key,
  //       value: json.encode(
  //         templateToCache.toJson(),
  //       ),
  //     );
  //   } else {
  //     throw CacheExeption(errorMessage: "No Internet Connection");
  //   }
  // }

  // Future<TemplateModel> getLastTemplate() {
  //   final jsonString = cache.getDataString(key: key);

  //   if (jsonString != null) {
  //     return Future.value(TemplateModel.fromJson(json.decode(jsonString)));
  //   } else {
  //     throw CacheException(errorMessage: "No Internet Connection");
  //   }
  // }
}
