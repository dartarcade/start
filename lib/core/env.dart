import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
class Env {
  @EnviedField()
  static const int port = _Env.port;
}
