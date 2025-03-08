import 'dart:io';

import 'package:arcade/arcade.dart';
import 'package:start/core/env.dart';
import 'package:start/core/init.dart';

Future<void> main(List<String> arguments) {
  final portFromEnvironment = Platform.environment['PORT'];
  var port = Env.port;
  if (portFromEnvironment != null) {
    port = int.parse(portFromEnvironment);
  }

  return runServer(
    port: port,
    init: init,
    closeServerAfterRoutesSetUp: arguments.contains('--export-routes'),
  );
}
