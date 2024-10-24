import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(useConstantCase: true, interpolate: true)
class Env {
  @EnviedField()
  static const int port = _Env.port;
}
