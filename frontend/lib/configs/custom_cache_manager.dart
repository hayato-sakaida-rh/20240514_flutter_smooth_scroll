import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CustomCacheManager extends CacheManager with ImageCacheManager {
  CustomCacheManager()
      : super(
          Config(
            'customCacheKey',
            stalePeriod: const Duration(days: 30), // NOTE: キャッシュ期間
            maxNrOfCacheObjects: 10000, // NOTE: キャッシュ上限枚数
          ),
        );
}
