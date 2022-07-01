import 'package:calculadora_imc_app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import '../repositories/calculadora_repository.dart';
import '../widgets/custom_field_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final HomeController _homeController =
      HomeController(CalculadoraRepository());

  void _resetFields() {
    pesoController.clear();
    alturaController.clear();
    _homeController.reset();
  }

  @override
  void initState() {
    super.initState();
    _homeController.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetFields,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.person_outline,
                      size: 120.0, color: Colors.green),
                  CustomFieldWidget(
                    controller: pesoController,
                    label: "Peso (kg)",
                    infoText: "Informe seu peso!",
                    formKey: formKey,
                  ),
                  CustomFieldWidget(
                    controller: alturaController,
                    label: "Altura (m)",
                    infoText: "Informe sua altura!",
                    formKey: formKey,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: SizedBox(
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              var altura =
                                  alturaController.text.replaceAll(",", ".");
                              _homeController.calcular(
                                  double.parse(pesoController.text),
                                  double.parse(altura));
                            }
                          },
                          child: const Text(
                            "Calcular",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25.0),
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                        ),
                      )),
                ],
              ),
            ),
            ValueListenableBuilder<String>(
              valueListenable: _homeController.infoText,
              builder: (context, infoText, child) {
                return Text(infoText,
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(color: Colors.green, fontSize: 25.0));
              },
            ),
          ],
        ),
      ),
    );
  }
}
