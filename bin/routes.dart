import 'dart:convert';
import 'package:arcade/arcade.dart';
import './start.dart' as app;

Future<void> main() async {
  await app.main(['--export-routes']);
  // ignore: avoid_print
  print(jsonEncode(getRouteMetadata()));
}
