import 'package:flutter_modular/flutter_modular.dart';

import 'core/infra/repositories/calculadora_repository.dart';
import 'modules/home/controllers/home_controller.dart';
import 'modules/home/views/home_view.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => CalculadoraRepository()),
    Bind.factory((i) => HomeController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => HomeView(
        homeController: Modular.get(),
      ),
    ),
  ];
}
