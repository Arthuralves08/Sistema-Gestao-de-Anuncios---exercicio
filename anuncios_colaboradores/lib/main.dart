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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),//cor do icone do vendedor 
        useMaterial3: true,
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget{
  const MainNavigation ({super.key});

  @override
  State <MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _paginaAtual = 0;

  final List<Widget> _paginas = [
    const HomeScreen(),
    const Center(child: Text('Favoritos', style: TextStyle(fontSize: 24),),),
    const Center(child: Text('Carrinho', style: TextStyle(fontSize: 24),),),
    const Center (child: Text('Perfil', style: TextStyle(fontSize: 24),),)
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(body: IndexedStack(index: _paginaAtual, children: _paginas,),
    bottomNavigationBar: BottomNavigationBar(currentIndex: _paginaAtual, onTap: (index){setState ((){
    _paginaAtual = index;});
    },
    type: BottomNavigationBarType.fixed,
    selectedItemColor:  Colors.black,//cor 
    unselectedItemColor: Colors.white, // cor dos icones da aba de navegação 
    backgroundColor: const Color.fromARGB(255, 168, 121, 104),// cor do fundo fa aba de icones laterais 
    items: const[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Carrinho'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
    ],
    ),
    );
  }
  
}