import 'dart:convert';

import 'package:arcade/arcade.dart';
import 'package:arcade_cache/arcade_cache.dart';
import 'package:arcade_cache_redis/arcade_cache_redis.dart';
import 'package:arcade_swagger/arcade_swagger.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:start/core/database/database.dart';
import 'package:start/core/env.dart';
import 'package:start/core/init.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> init() async {
  await getIt.init();

  setupSwagger(
    title: 'Aracde API',
    version: '1.0.0',
  );

  route.addBeforeHookForPath(
    '/ui',
    (context) {
      // Validate basic auth. Send a prompt for the browser if not authenticated.
      final auth = context.requestHeaders['Authorization'];
      if (auth == null) {
        context.statusCode = 401;
        context.responseHeaders.set('WWW-Authenticate', 'Basic');
        return context;
      }

      const username = 'admin';
      const password = 'admin';
      final authValue = auth.first.split(' ').last;
      final decoded = base64Decode(authValue);
      final decodedString = utf8.decode(decoded);
      final credentials = decodedString.split(':');
      if (credentials.length != 2) {
        context.statusCode = 401;
        context.responseHeaders.set('WWW-Authenticate', 'Basic');
        return context;
      }

      final [authUsername, authPassword] = credentials;
      if (authUsername != username || authPassword != password) {
        context.statusCode = 401;
        context.responseHeaders.set('WWW-Authenticate', 'Basic');
        return context;
      }

      // If we get here, the user is authenticated.
      context.responseHeaders.set('X-Auth-Username', username);

      return context;
    },
  );
}

@module
abstract class AdditionalDependencies {
  @singleton
  Database get database => Database();

  @preResolve
  @singleton
  Future<BaseCacheManager> get cacheManager async {
    final cache = RedisCacheManager();
    final uri = Uri.parse(Env.redisUrl);
    await cache.init(
      (
        host: uri.host,
        port: uri.port,
        secure: uri.scheme == 'rediss',
      ),
    );
    return cache;
  }
}
