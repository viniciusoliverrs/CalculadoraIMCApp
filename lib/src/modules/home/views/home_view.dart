import 'package:flutter/material.dart';

import '../../../core/presenter/theme/appcolors.dart';
import '../../../core/presenter/theme/appsizes.dart';
import '../../../core/presenter/common_widgets/common_text_field.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  final HomeController homeController;
  const HomeView({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: widget.homeController.resetar,
          ),
        ],
      ),
      backgroundColor: AppColors.light,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          children: [
            Form(
              key: widget.homeController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CommonTextField(
                    controller: widget.homeController.pesoController,
                    label: "Peso (kg)",
                    infoText: "Informe seu peso!",
                    formKey: widget.homeController.formKey,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Informe seu peso!";
                      }
                    },
                  ),
                  CommonTextField(
                    controller: widget.homeController.alturaController,
                    label: "Altura (m)",
                    infoText: "Informe sua altura!",
                    formKey: widget.homeController.formKey,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Informe sua altura!";
                      }
                    },
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.width * 0.15,
                        child: ElevatedButton(
                          onPressed: () {
                            if (widget.homeController.formKey.currentState!
                                .validate()) {
                              var altura = widget
                                  .homeController.alturaController.text
                                  .replaceAll(",", ".");
                              widget.homeController.calcular(
                                  double.parse(widget
                                      .homeController.pesoController.text),
                                  double.parse(altura));
                            }
                          },
                          child: const Text(
                            "Calcular",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: AppSizes.fontSizeLarge,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            ValueListenableBuilder<String>(
              valueListenable: widget.homeController.infoText,
              builder: (context, infoText, child) {
                return Text(infoText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: AppSizes.fontSizeLarge,
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
