import "package:flutter/material.dart";
import 'package:get_it/get_it.dart';

import 'appwidget.dart';
import 'infra/repositories/calculadora_repository.dart';
import 'ui/controllers/home_controller.dart';
GetIt getIt = GetIt.instance;
void setup() {
  getIt.registerFactory<HomeController>(
      () => HomeController(CalculadoraRepository()));
}

void main() {
  runApp(const AppWidget());
}
