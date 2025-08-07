import 'package:flutter/material.dart';
import 'package:anuncios_colaboradores/data/anuncios_mock.dart';
import 'package:anuncios_colaboradores/widgets/anuncio_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  
  

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen> {
  int paginaAtual = 0;
  

  
  final List<String> categorias = ['Todos', 'Automoveis', 'Eletrónicos'];
   String categoriaSelecionada = 'Todos';

  final TextEditingController searchController = TextEditingController();
  String termoBusca = '';

  List<Map<String, dynamic>> anunciosFiltrados = [];
  List<Map<String, dynamic>> anunciosVisiveis = [];
  int itensPorPagina = 5;

  @override
  void initState(){
    super.initState();
    _atualizarLista();
  }

  void _atualizarLista(){
    final lista = anunciosMock.where((anuncio){
      final correspondeCategoria=
      categoriaSelecionada == 'Todos' || anuncio ['tipo'] ==categoriaSelecionada;
      final correspondeBusca = anuncio ['titulo'].toLowerCase().contains(termoBusca.toLowerCase());
      return correspondeCategoria && correspondeBusca;
    }).toList();

    setState(() {
      anunciosFiltrados = lista;
      anunciosVisiveis = lista.take(itensPorPagina).toList();
    });
    
  }

  void _carregarMais(){
    final totalVisiveis = anunciosVisiveis.length;
    final novosItens = anunciosFiltrados.skip(totalVisiveis).take(itensPorPagina).toList();

    setState(() {
      anunciosVisiveis.addAll(novosItens);
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: const Text("Buscador de anúncios"),
  backgroundColor: const Color.fromARGB(255, 168, 121, 104), foregroundColor: Colors.white,// buscador de anuncio, cor do fundo e letra
  ),
  body: Column(
    
  children: [
          
      SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(8),
      child: Row(  
      children: categorias.map((categoria) {
      return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
      label: Text(categoria),
      selected: categoriaSelecionada == categoria,
      onSelected: (_) {
        setState(() {
        categoriaSelecionada = categoria;
        });
          _atualizarLista();
           },
          ),
         );
         }).toList(),
         ),
         ),

          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            
            child: TextField(
              
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Buscar',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  
                ),
              ),
              onChanged: (value) {
                termoBusca = value;
                _atualizarLista();
              },
            ),
          ),

          
          Expanded(
            
            child: ListView.builder(
            itemCount: anunciosVisiveis.length + 1,
            itemBuilder: (context, index) {
            if (index < anunciosVisiveis.length) {
           return AnuncioCard(anuncio: anunciosVisiveis[index]);
            } else {
           final temMais = anunciosVisiveis.length < anunciosFiltrados.length;

            return temMais

           ? Padding(
            
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor:const Color.fromARGB(255, 168, 121, 104),foregroundColor: Colors.white ) ,// cor e letra do botao
            onPressed: _carregarMais,
            child: const Text('Ver mais') ,
              ),
                )
                 :const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  

      
  }

    
}