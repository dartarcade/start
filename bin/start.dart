import 'package:dartseid/dartseid.dart';
import 'package:start/core/env.dart';
import 'package:start/core/init.dart';

Future<void> main() async {
  return runServer(port: Env.port, init: init);
}
