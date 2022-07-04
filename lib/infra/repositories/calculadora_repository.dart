import 'dart:ffi';

import 'package:calculadora_imc_app/domain/repositories/icalculadora_repository.dart';

class CalculadoraRepository implements ICalculadoraRepository {
  @override
  double dividir(double a, double b) {
    return a / b;
  }

  @override
  double multiplicar(double a, double b) {
    return a * b;
  }

  @override
  double calcularIMC(double peso, double altura) {
    altura = dividir(altura, 100);
    double imc = dividir(peso, multiplicar(altura, altura));

    return imc;
  }

  @override
  String verificarIMC(double imc) {
    if (imc <= 18.5) {
      return "Magreza (${imc.toStringAsPrecision(3)})";
    } else if (imc >= 18.6 && imc <= 24.9) {
      return "Normal (${imc.toStringAsPrecision(3)})";
    } else if (imc >= 25 && imc <= 29.9) {
      return "Sobrepeso (${imc.toStringAsPrecision(3)})";
    } else if (imc >= 30 && imc <= 39.9) {
      return "Obesidade (${imc.toStringAsPrecision(3)})";
    } else if (imc >= 40) {
      return "Obesidade Grave (${imc.toStringAsPrecision(3)})";
    }
    return "";
  }
}
