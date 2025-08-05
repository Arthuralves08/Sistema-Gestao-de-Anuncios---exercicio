import 'package:anuncios_colaboradores/screens/home_screen.dart';
import 'package:flutter/material.dart';


  void main (){
    runApp(const AnuncioProject());
  }

  class AnuncioProject extends StatelessWidget{
    const AnuncioProject({super.key});


    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscador Anuncio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

