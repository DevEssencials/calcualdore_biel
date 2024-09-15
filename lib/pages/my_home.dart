import 'package:calculadore_flutter/models/model_imc.dart';
import 'package:calculadore_flutter/util/erros_snak';
import 'package:calculadore_flutter/util/validator.dart';
import 'package:calculadore_flutter/util/widgets.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with ValidatorTextField {
  
  List<dynamic> buttons = [1, 2, 3, 4, 5, 6, 7, 8, 9, '.', 0, 'Apagar'];
  final TextEditingController _controllerPeso = TextEditingController();
  final TextEditingController _controllerAlt = TextEditingController();
  late bool isAltura;
  String? imcResult = "";
  String classificacao = "Descubra seu IMC";
  final FocusNode _focusNodePeso = FocusNode();
  final FocusNode _focusNodeAltura = FocusNode();
  final FocusScopeNode _focusScopeNode = FocusScopeNode();  // Para gerenciar o escopo de foco

  void inserirValor(String buttao, TextEditingController campoSelecionado) {
    setState(() {
      if (buttao == 'Apagar') {
        _apagarText(campoSelecionado);
      } else {
        if (buttao == '.' && campoSelecionado.text.contains('.')) {
          return;
        }
        campoSelecionado.text += buttao;
      }
    });
  }

  void _apagarText(TextEditingController campoSelecionado) {
    setState(() {
      if (campoSelecionado.text.isNotEmpty) {
        campoSelecionado.text = campoSelecionado.text.substring(0, campoSelecionado.text.length - 1);
      }
    });
  }

  void _calcularIMC(BuildContext cntx) {
    
    if(_controllerAlt.text.isEmpty){
      Failures.showError(context, EmptyFieldFailure());
      return;
    }
    if(_controllerPeso.text.isEmpty){
      Failures.showError(context, EmptyFieldFailure());
      return;
    }
    final double? peso = validateAndConvert(_controllerPeso.text);
    final double? altura = validateAndConvert(_controllerAlt.text);
    if (peso == null) {
      Failures.showError(context, NumericConversionFailure());
      return;
    }

    if (altura == null || altura <= 0) {
      Failures.showError(context, InvalidValueFailure());
      return;
    }
    setState(() {
      final ModelImc modelImc = ModelImc(altura, peso);
      double imc = modelImc.calcularImc(altura, peso);
      imcResult = imc.toStringAsFixed(2);
      classificacao = modelImc.verificarClassificacao(imc);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Calculador IMC",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FocusScope(
            node: _focusScopeNode,  // Gerencia o foco dentro do escopo
            child: Column(
              children: [
                Text(
                  classificacao,
                  style: styleText(),
                ),
                espacamento(),
                SizedBox(
                  height: 150,
                  width: 400,
                  child: Center(
                    child: Image.asset('assets/images/skaterson.jpg'),
                  ),
                ),
                customTextField(
                  "Peso:  ",
                  "Digite o peso",
                  _controllerPeso,
                  _focusNodePeso,
                  () => setState(() {
                    isAltura = false;
                  }),
                ),
                customTextField(
                  "Altura:",
                  "Digite a altura",
                  _controllerAlt,
                  _focusNodeAltura,
                  () => setState(() {
                    isAltura = true;
                  }),
                ),
                espacamento(),
                Center(
                  child: Text(
                    "IMC: $imcResult",
                    style: styleText(),
                  ),
                ),
                espacamento(),
                SizedBox(
                  height: 225,
                  child: GridView.builder(
                    gridDelegate: gridDelegate(),
                    itemCount: buttons.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(
                          onPressed: () {
                            inserirValor(
                              buttons[index].toString(),
                              (isAltura) ? _controllerAlt : _controllerPeso
                            );
                          },
                          child: Text(
                            buttons[index].toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _calcularIMC(context),  // Chama a função para calcular o IMC
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: const Text(
                    "Calcular IMC",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
