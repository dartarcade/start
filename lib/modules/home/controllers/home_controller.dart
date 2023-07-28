import 'package:dartseid/dartseid.dart';
import 'package:injectable/injectable.dart';
import 'package:start/modules/home/services/home_service.dart';

@singleton
class HomeController {
  final HomeService _homeService;

  HomeController(this._homeService) {
    Route.get('/').handle(sayHello);
    Route.get('/:name').handle(greet);
  }

  Future<String> sayHello(RequestContext context) async {
    return _homeService.greet('World');
  }

  Future<String> greet(RequestContext context) async {
    return _homeService.greet(context.pathParameters['name']!);
  }
}
