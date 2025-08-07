import 'package:flutter/material.dart';
import 'package:anuncios_colaboradores/screens/contato_vendedor_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class DetalheAnuncioScreen extends StatelessWidget {
  final Map<String, dynamic> anuncio;

  const DetalheAnuncioScreen({super.key, required this.anuncio});

  @override
  Widget build (BuildContext context) {
    final imagemPrincipal = (anuncio ['imagens']as List).isNotEmpty?
    (anuncio ['imagens'] as List)[0].toString(): '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(255, 168, 121, 104),
        foregroundColor: Colors.white,
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
                imagemPrincipal,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (context , error, StackTrace){

                return Container(

                    height: 220,
                    color: Colors.green[300],
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
                anuncio ['tipo'],
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold,)),
                
                const SizedBox(height: 8,),
                Text(
                  'R\$ ${anuncio['preco'].toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, color: Colors.red),
                ),
                
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const[
                      Icon(Icons.star, color: Colors.yellow),//colocando estrelas de avaliação
                      SizedBox(width: 4,),
                      Text('4.8 (10 reviews)', style: TextStyle(fontSize: 16),),//escrevendo a avaliação
                    ],

                  ),
                  
                   ElevatedButton(onPressed: (//colocando o qeu botao fara quando for apertado
                    
                   ) {
                    //fazendo com que suba uma mensagem de funcionalidade em desenvolvimento
                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Funcionalidade em desenvolvimento'), backgroundColor: const Color.fromARGB(255, 168, 121, 104)),);
                   }, child: const Text('Mapa'),//botao do mapa
                   style: ElevatedButton.styleFrom(backgroundColor:const Color.fromARGB(255, 168, 121, 104), foregroundColor: Colors.white )),//mudando a cor do fundo e a letra
                  
                ],
              ),
              const SizedBox(height: 16,),

              Text (anuncio['descricao']?? 'sem descricao disponivel',
              style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24,),

              SizedBox( //criando botao
                width: double.infinity,
                child: ElevatedButton.icon(icon: const Icon(Icons.call),//colocando o icone do botao de chamada
                 label: const Text('Ligar para o Vendedor'),// colocando texto no botao
                 style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 168, 121, 104), foregroundColor: Colors.white),//mudando cor do fundo e da escrita
                 

                 onPressed:() async{//criando o que o botao fara quando for pressionado
                 final telefone = anuncio['telefone']?? '+91 9076543210';//criei variavel telefone, pega o que ta no anuncios e se nn tiver liga no numero padrao
                 final uri = Uri.parse('tel:$telefone'); //uri de telefone
                 if (await canLaunchUrl(uri)){
                  await launchUrl(uri);

                 }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(content: Text('Não foi possivel realizar a chamada'), backgroundColor: const Color.fromARGB(255, 168, 121, 104)
                    ),
                    
                  );
                 }

                 },
              ),
              ),
                const SizedBox(height: 12,),

              SizedBox( width: double.infinity,//criando botao
              child: ElevatedButton(onPressed: () {
              
              Navigator.push( //ação do botao
              context,
              MaterialPageRoute(
              builder: (context) => ContatoVendedorScreen(//vai para a tela do contato vendedor
              nomeVendedor: anuncio['titulo'], //informaç~~ao da tela
              telefone: "+91 9076543210", //telefone vendedor
               ),
              )
              
            );
              },
                style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 168, 121, 104), foregroundColor: Colors.white),//mudando cor do fundo e da letra
               child: const Text('Contate o vendedor')),

              ),
              ],
      ),
    
          
    
          
        ),
      );
    
  }
}