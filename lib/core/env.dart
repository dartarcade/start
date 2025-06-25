import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(useConstantCase: true)
class Env {
  const Env._();

  @EnviedField()
  static const int port = _Env.port;

  @EnviedField()
  static const String databaseUrl = _Env.databaseUrl;

  @EnviedField()
  static const String redisUrl = _Env.redisUrl;
}
