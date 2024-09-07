import 'package:flutter/material.dart';

List<String> buttons = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '0', 'Enter'];

Widget buildButtonGrid() {
  return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    
                    mainAxisExtent: 60.0,
                    crossAxisSpacing: 3.0,
                    mainAxisSpacing: 3.0,),

                  itemCount: buttons.length,
                  itemBuilder: (BuildContext ctx, index){
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: TextButton(
                        onPressed:(){
                          
                        },
                        child: Text(buttons[index], 
                          style: const TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                    );
                  },
                );
}



