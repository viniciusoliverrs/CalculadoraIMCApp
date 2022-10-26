abstract class ICalculadoraRepository {
  double multiplicar(double a, double b);
  double dividir(double a, double b);
  String verificarIMC(double imc);
  double calcularIMC(double peso, double altura);
}