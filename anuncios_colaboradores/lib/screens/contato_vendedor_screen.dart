

import 'package:flutter/material.dart';

class ContatoVendedorScreen extends StatefulWidget{
  final String nomeVendedor;
  final String telefone;

  const ContatoVendedorScreen({
    super.key, required this.nomeVendedor, required this.telefone,
  });


  @override
  State<ContatoVendedorScreen> createState() => _ContatoVendedorScreenState();
}

class _ContatoVendedorScreenState extends State<ContatoVendedorScreen>{
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mensagemController = TextEditingController();

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 168, 121, 104),// cor do fundo deatlhe
        foregroundColor: Colors.white,// cor do letra
        title: const Text("Detalhe"),//nome do botao
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back),//ação do botao ao ser precionado(volta pra tela)
        ),
      ),

      body: SingleChildScrollView(padding: const EdgeInsets.all(16),
      child: Column(children: [
        const CircleAvatar(
      radius: 40,
      child: Icon(Icons.person, size:40),
        ),
        const SizedBox(height: 8,),
        Text( widget.nomeVendedor, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
        
        ),
        const SizedBox(height: 16,),
        


        Row(children: [  //aqui é o telefone
          const Icon(Icons.call),
          const SizedBox(width: 8,),
          Text("Mobile:  ${widget.telefone}"),
        ],),

const SizedBox(height: 16),

            
      Form( //aqui é o Formulário
           key: _formKey,
           child: Column(
            
           children: [
          TextFormField(
            controller: nomeController,
            decoration: const InputDecoration(
            labelText: "Nome",
               border: OutlineInputBorder(),
               ),
                maxLength: 50,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                  return "Informe seu nome";
                    }
                  if (value.length > 50) {
                  return "Máximo 50 caracteres";
                   }
                  return null;
                },
                 ),
              const SizedBox(height: 12),
                  TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "e-mail",
                    border: OutlineInputBorder(),

                    ),
                    validator: (value) { //valida e-mail
                    if (value == null || value.isEmpty) {
                    return "Informe seu e-mail";
                    }
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegex.hasMatch(value)) {
                    return "Formato de e-mail inválido";
                    }
                    return null;
                    },
                  ),
                  const SizedBox(height: 12),

                  TextFormField(
                    controller: mensagemController,
                    maxLines: 3,
                    maxLength: 100,
                    decoration: const InputDecoration(
                    labelText: "mensagem",
                    border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                    if (value == null || value.isEmpty) {
                     return "Digite uma mensagem";
                   }
                    if (value.length > 100) {
                    return "Máximo 100 caracteres";
                    }
                    return null;
                  },
                ),
                ],
              ),
            ),
            const SizedBox(height: 20),


            SizedBox(   
              
                       //aqui é o  Botão Enviar
              width: double.infinity,
              
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor:const Color.fromARGB(255, 168, 121, 104), foregroundColor: Colors.white),// editei a cor do fundo e cor do texto do botao
                onPressed: () {
                  
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("e-mail enviado com sucesso!"), backgroundColor: const Color.fromARGB(255, 168, 121, 104)),
                      //botao de enviar correio, texto e cor
                    );
                    
                  }
                  
                },
                child: const Text("Enviar E-mail"),
                
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
        
      