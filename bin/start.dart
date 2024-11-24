import 'package:arcade/arcade.dart';
import 'package:start/core/env.dart';
import 'package:start/core/init.dart';

Future<void> main() async {
  const dev = !bool.fromEnvironment('dart.vm.product');
  return runServer(
    port: Env.port,
    init: init,
    logLevel: dev ? LogLevel.info : LogLevel.error,
  );
}
