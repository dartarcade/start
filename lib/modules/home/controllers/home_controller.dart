import 'package:arcade/arcade.dart';
import 'package:injectable/injectable.dart';
import 'package:start/modules/home/dtos/greet.dart';
import 'package:start/modules/home/services/home_service.dart';
import 'package:start/shared/extensions/luthor_extension.dart';

@singleton
class HomeController {
  final HomeService _homeService;

  HomeController(this._homeService) {
    route.get('/').handle(sayHello);
    route.get('/json').handle(greetJson);
    route.get('/:name').handle(greet);
  }

  Future<String> sayHello(RequestContext context) async {
    return _homeService.greet('World');
  }

  Future<String> greet(RequestContext context) async {
    return _homeService.greet(context.pathParameters['name']!);
  }

  Future<GreetResponse> greetJson(RequestContext context) async {
    final body = await $GreetRequestValidate.withLuthor(context);
    return _homeService.greetJson(body.name);
  }
}
