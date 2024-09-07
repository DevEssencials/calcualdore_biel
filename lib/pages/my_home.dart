import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> buttons = [1, 2, 3, 4, 5, 6, 7, 8, 9, '.', 0, 'Enter'];
  final TextEditingController _controllerPeso = TextEditingController();
  final TextEditingController _controllerAlt = TextEditingController();
  bool isAltura = false;
  String imcResult = "";
  final FocusNode _focusNodePeso = FocusNode();
  final FocusNode _focusNodeAltura = FocusNode();
  final FocusScopeNode _focusScopeNode = FocusScopeNode();  // Para gerenciar o escopo de foco

  void inserirValor(String buttao, TextEditingController campoSelecionado) {
    setState(() {
      // Lógica para evitar entrada incorreta
      if (buttao == 'Enter') {
        _calcularIMC();
        _focusScopeNode.unfocus(); // Desfoca todos os campos
      } else {
        if (buttao == '.' && campoSelecionado.text.contains('.')) {
          return; // Evita múltiplos pontos
        }
        campoSelecionado.text += buttao;
      }
    });
  }

  void _calcularIMC() {
    //calcular imc
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
                // Imagem
                Center(child: Image.asset('assets/images/skaterson.jpg')),
                // Campo de Peso
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Peso: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _controllerPeso,
                          decoration:
                              const InputDecoration(hintText: "Digite seu peso "),
                          keyboardType: TextInputType.none, // Desabilita teclado virtual
                          focusNode: _focusNodePeso,  // Gerencia o foco manualmente
                          onTap: () => setState(() {
                            isAltura = false;
                            _focusScopeNode.requestFocus(_focusNodePeso);  // Mantém o foco
                          }),
                        ),
                      ),
                    )
                  ],
                ),
                // Campo de Altura
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Altura: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _controllerAlt,
                          decoration:
                              const InputDecoration(hintText: "Digite sua altura "),
                          keyboardType: TextInputType.none, // Desabilita teclado virtual
                          focusNode: _focusNodeAltura,  // Gerencia o foco manualmente
                          onTap: () => setState(() {
                            isAltura = true;
                            _focusScopeNode.requestFocus(_focusNodeAltura);  // Mantém o foco
                          }),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                // Exibição do IMC
                Center(
                  child: Text(
                    "IMC: $imcResult",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                // Teclado numérico
                SizedBox(
                  height: 200,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisExtent: 60.0,
                      crossAxisSpacing: 3.0,
                      mainAxisSpacing: 3.0,
                    ),
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
                            inserirValor(buttons[index].toString(),
                                (isAltura) ? _controllerAlt : _controllerPeso);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
