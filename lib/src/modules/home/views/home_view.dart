import 'package:flutter/material.dart';

import '../../../core/presenter/theme/appcolors.dart';
import '../../../core/presenter/theme/appsizes.dart';
import '../../../core/presenter/widgets/common_text_field.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  final HomeController homeController;
   HomeView({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void _resetFields() {
    pesoController.clear();
    alturaController.clear();
    widget.homeController.reset();
  }

  @override
  void initState() {
    super.initState();
    widget.homeController.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetFields,
          ),
        ],
      ),
      backgroundColor: AppColors.light,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.person_outline,
                    size: AppSizes.iconSizeLarge,
                    color: AppColors.primary,
                  ),
                  CommonTextField(
                    controller: pesoController,
                    label: "Peso (kg)",
                    infoText: "Informe seu peso!",
                    formKey: formKey,
                  ),
                  CommonTextField(
                    controller: alturaController,
                    label: "Altura (m)",
                    infoText: "Informe sua altura!",
                    formKey: formKey,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.width * 0.15,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              var altura =
                                  alturaController.text.replaceAll(",", ".");
                              widget.homeController.calcular(
                                  double.parse(pesoController.text),
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
