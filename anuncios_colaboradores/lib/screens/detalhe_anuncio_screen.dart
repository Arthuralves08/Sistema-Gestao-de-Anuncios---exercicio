import 'package:flutter/material.dart';
import 'package:anuncios_colaboradores/screens/contato_vendedor_screen.dart';

class DetalheAnuncioScreen extends StatelessWidget {
  final Map<String, dynamic> anuncio;

  const DetalheAnuncioScreen({super.key, required this.anuncio});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Detalhe Anúcio'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(

              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                anuncio ['imagem'],
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (context , error, StackTrace){

                return Container(

                    height: 220,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, size: 80,)
                  );
                },
              ),
            ),
              const SizedBox(height: 16,),

              Text(
                anuncio ['titulo'],
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  'R\$ ${anuncio['preco'].toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, color: Colors.red),
                ),
                const SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const[
                      Icon(Icons.star, color: Colors.yellow),
                      SizedBox(width: 4,),
                      Text('4.8 (10 reviews)', style: TextStyle(fontSize: 16),),
                    ],

                  ),

                  ElevatedButton(onPressed: () {}, child: const Text('Mapa')),
                ],
              ),
              const SizedBox(height: 16,),

              Text (anuncio['descricao']?? 'sem descricao disponivel',
              style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24,),


              SizedBox( width: double.infinity,
              child: ElevatedButton(onPressed: () {
              
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => ContatoVendedorScreen(
              nomeVendedor: anuncio['titulo'], 
              telefone: "+91 90765 43210", 
               ),
              )
              
            );
              },
                
               child: const Text('Contate o vendedor')),

              ),
          ],
          
        )
      ),
    );
  }
}