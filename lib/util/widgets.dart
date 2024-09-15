import 'package:flutter/material.dart';

InputDecoration decoration(String hint){
  return InputDecoration(
    hintText: hint,
    border: const OutlineInputBorder(),
  );
}



SliverGridDelegateWithFixedCrossAxisCount gridDelegate(){
  return  const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    mainAxisExtent: 50.0,
    crossAxisSpacing: 3.0,
    mainAxisSpacing: 3.0,          
  );
}


TextStyle styleText(){
  return const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
}

SizedBox espacamento(){
  return const SizedBox(
    height: 10,
  );
}

Widget customTextField(
  String valor,
  String hint,
  TextEditingController controller, 
  FocusNode foco, 
  VoidCallback onTap,
  ){
  return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      valor,
                      style: styleText(),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: controller,
                          decoration: decoration(hint),
                          keyboardType: TextInputType.none, // Desabilita teclado virtual
                          focusNode: foco,  // Gerencia o foco manualmente
                          onTap: onTap,
                          validator: (value) {
                            if(value == null || value.isEmpty)return "Valor não pode ser nulo";
                            return null;
                          },
                        ),
                      ),
                    )
                  ],
                );
}

