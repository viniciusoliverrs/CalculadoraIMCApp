import 'package:calculadora_imc_app/repositories/interfaces/icalculadora_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final ValueNotifier<double> _resultado = ValueNotifier(0);
  final ValueNotifier<String> _infoText = ValueNotifier("Informe seus dados!");


  final ICalculadoraRepository calculadoraRepository;

  HomeController(this.calculadoraRepository);

  get resultado => _resultado;
  get infoText => _infoText;

  void reset() {
    _resultado.value = 0;
    _infoText.value = "Informe seus dados!";
  }

  void calcular(double peso, double altura) {
    double imc = calculadoraRepository.calcularIMC(peso, altura);
    String info = calculadoraRepository.verificarIMC(imc);

    _resultado.value = imc;
    _infoText.value = info;
  }
}
