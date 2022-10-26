import 'package:calculadora_imc_app/src/core/domain/repositories/icalculadora_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/infra/repositories/calculadora_repository.dart';
import 'modules/home/controllers/home_controller.dart';
import 'modules/home/views/home_view.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<ICalculadoraRepository>(
        (i) => CalculadoraRepository()), // Verificar se é necessário o tipo
    Bind.lazySingleton<HomeController>((i) => HomeController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => HomeView(
        homeController: Modular.get<HomeController>(),
      ),
    ),
  ];
}
