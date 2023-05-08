// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, body_might_complete_normally_nullable

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: CalcImc(),
    debugShowCheckedModeBanner: false,
  ));
}

class CalcImc extends StatefulWidget {
  const CalcImc({super.key});

  @override
  State<CalcImc> createState() => _CalcImcState();
}

class _CalcImcState extends State<CalcImc> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String info = "Informe seus dados";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void calcular() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);
      //print(imc);
      if (imc < 18.5) {
        info = "Abaixo do peso \n (Seu imc é ${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.5 && imc <= 24.9) {
        info = "Peso normal \n (Seu imc é ${imc.toStringAsPrecision(3)})";
      } else if (imc >= 25.0 && imc <= 29.9) {
        info = "Sobrepeso \n (Seu imc é ${imc.toStringAsPrecision(3)})";
      } else if (imc >= 30.0 && imc <= 34.9) {
        info = "Obesidade grau 1 \n (Seu imc é ${imc.toStringAsPrecision(3)})";
      } else {
        info = "Obesidade grau 2 \n (Seu imc é ${imc.toStringAsPrecision(3)})";
      }
    });
  }

  void resetCampos() {
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      info = "Informe seus dados";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Calculadora IMC",
              style: TextStyle(
                color: Colors.black,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Colors.white,
                  )
                ],
              )),
          backgroundColor: Colors.amber,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                resetCampos();
              },
              icon: Icon(
                Icons.refresh,
                color: Colors.black,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10),
                Icon(
                  Icons.person,
                  size: 120,
                  color: Colors.amber,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(height: 50),
                TextFormField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.amber,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.monitor_weight,
                      size: 50,
                      color: Colors.amber,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0.8, 0.8),
                          blurRadius: 1.0,
                          color: Colors.white,
                        )
                      ],
                    ),
                    labelText: "Peso (Kg)",
                    labelStyle: TextStyle(
                      color: Colors.amber,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0.8, 0.8),
                          blurRadius: 1.0,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.amber, fontSize: 25),
                  controller: pesoController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "insira seu peso";
                    }
                  },
                ),
                SizedBox(height: 50),
                TextFormField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.amber,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.height,
                      size: 50,
                      color: Colors.amber,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0.8, 0.8),
                          blurRadius: 1.0,
                          color: Colors.white,
                        )
                      ],
                    ),
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(
                      color: Colors.amber,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0.8, 0.8),
                          blurRadius: 1.0,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.amber, fontSize: 25),
                  controller: alturaController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "insira sua altura";
                    }
                  },
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      calcular();
                    }
                  },
                  child: Text(
                    'Calcular',
                    style: TextStyle(
                      color: Colors.black,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 3.0,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: Colors.amber,
                    textStyle: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  info,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 25,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0.8, 0.8),
                        blurRadius: 1.0,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
