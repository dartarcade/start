import 'package:injectable/injectable.dart';

@singleton
class HomeService {
  String greet(String name) => 'Hello, $name!';
}
