import 'package:anuncios_colaboradores/data/anuncios_mock.dart';

class AnuncioController {
  final int itensPorPagina;
  List<Map<String, dynamic>> anunciosFiltrados =[];
  List<Map<String, dynamic>> anunciosVisiveis= [];


  AnuncioController({this.itensPorPagina = 5 });

  void atualizarLista({String categoriaSelecionada =  'Todos', String termoBusca =''}) {
    final lista = anunciosMock.where ((anuncio){
      final correspondeCategoria = categoriaSelecionada == 'Todos' || anuncio ['tipo'] == categoriaSelecionada;
      final correspondeBusca = anuncio ['titulo'].toLowerCase().contains(termoBusca.toLowerCase());
      return correspondeCategoria && correspondeBusca;

    }).toList();


    anunciosFiltrados = lista;
    anunciosVisiveis = lista.take(itensPorPagina).toList();

  }

  void carregarMais(){
    final totalVisiveis = anunciosVisiveis.length;
    final novosItens = anunciosFiltrados.skip(totalVisiveis).take(itensPorPagina).toList();
    anunciosVisiveis.addAll(novosItens);
  }
}