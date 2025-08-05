import 'package:flutter/material.dart';
import 'package:anuncios_colaboradores/screens/detalhe_anuncio_screen.dart';


class AnuncioCard extends StatelessWidget{
  final Map<String,dynamic> anuncio;

  const AnuncioCard({super.key, required this.anuncio});


  @override
  Widget build(BuildContext context) {
    return Card (
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      child: ListTile(
        leading: Image.asset(
        anuncio ['imagem'],
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace){
            return const Icon(Icons.broken_image, size: 50,);
          },

        ),
        title: Text(anuncio['titulo']),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('R\$ ${anuncio['preco'].toStringAsFixed(2)}'),
            Text(anuncio['descricao'] ?? '', style: TextStyle(fontSize: 12)),
            
  ],
),
onTap: () {
  Navigator.push(context, MaterialPageRoute(builder: (context) => DetalheAnuncioScreen(anuncio: anuncio),),);
},
      ),);
    
  }
}