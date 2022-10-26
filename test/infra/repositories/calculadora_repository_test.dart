import 'package:calculadora_imc_app/src/core/infra/repositories/calculadora_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
late final CalculadoraRepository _calculadoraRepository;
  setUp(() {
    _calculadoraRepository = CalculadoraRepository();
  });
  group('CalculadoraRepository', () {
    test('Deve retornar falhar na multiplicação de dois números', () {
      final resultado = _calculadoraRepository.multiplicar(2, 2);
      expect(resultado == 6,false);
    });
    test('Deve retornar a multiplicação de dois números', () {
      final resultado = _calculadoraRepository.multiplicar(2, 2);
      expect(resultado, 4);
    });
  });

  group('CalculadoraRepository', () {
    test('Deve retornar falhar na divisão de dois números', () {
      final resultado = _calculadoraRepository.dividir(2, 2);
      expect(resultado == 3,false);
    });
    test('Deve retornar a divisão de dois números', () {
      final resultado = _calculadoraRepository.dividir(2, 2);
      expect(resultado, 1);
    });
  });
}