import 'package:calculadora_imc_app/src/core/domain/repositories/icalculadora_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  late final ValueNotifier<double> _resultado;
  late final ValueNotifier<String> _infoText;
  late final TextEditingController pesoController;
  late final TextEditingController alturaController;
  late final GlobalKey<FormState> formKey;

  final ICalculadoraRepository calculadoraRepository;

  HomeController(this.calculadoraRepository) {
    _resultado = ValueNotifier(0.0);
    _infoText = ValueNotifier("");
    pesoController = TextEditingController();
    alturaController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  get resultado => _resultado;
  get infoText => _infoText;


  void calcular(double peso, double altura) {
    double imc = calculadoraRepository.calcularIMC(peso, altura);
    String info = calculadoraRepository.verificarIMC(imc);

    _resultado.value = imc;
    _infoText.value = info;
  }

  void dispose() {
    _resultado.dispose();
    _infoText.dispose();
    pesoController.dispose();
    alturaController.dispose();
  }

  void resetar() {
    pesoController.clear();
    alturaController.clear();
     _resultado.value = 0;
    _infoText.value = "";
  }
}
