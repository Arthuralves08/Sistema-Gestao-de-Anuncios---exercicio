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

  @override
  Widget build(BuildContext context) {
    Widget corpo;

    
    if (paginaAtual == 0) {
      final anunciosFiltrados = anunciosMock.where((anuncio) {
        final correspondeCategoria = categoriaSelecionada == 'Todos' ||
            anuncio['tipo'] == categoriaSelecionada;
        final correspondeBusca = anuncio['titulo']
            .toLowerCase()
            .contains(termoBusca.toLowerCase());
        return correspondeCategoria && correspondeBusca;
      }).toList();

      corpo = Column(
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
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          
          Padding(   // aqui é a Barra de busca
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
                setState(() {
                  termoBusca = value;
                });
              },
            ),
          ),
          
          Expanded(   // aquui é a Lista de anúncios
            child: ListView.builder(
              itemCount: anunciosFiltrados.length,
              itemBuilder: (context, index) {
                return AnuncioCard(anuncio: anunciosFiltrados[index]);
              },
            ),
          ),
        ],
      );
    } else {
      
      corpo = Center(
        child: Text(
          ['Início', 'Carrinho', 'Buscar', 'Favoritos', 'Perfil'][paginaAtual],
          style: const TextStyle(fontSize: 24),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Buscador de anúncios"),
      ),
      body: corpo,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            paginaAtual = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrinho',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}