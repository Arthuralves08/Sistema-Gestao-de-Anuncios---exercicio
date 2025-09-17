import 'package:flutter_test/flutter_test.dart';
import 'package:anuncios_colaboradores/controllers/anuncio_controller.dart';
import 'package:anuncios_colaboradores/data/anuncios_mock.dart';

void main() {
  group('AnuncioController', () {
    test('Deve filtrar todos os anúncios quando categoria = Todos', () { //teste para a categoria todos
      final controller = AnuncioController(itensPorPagina: 5);
      controller.atualizarLista(categoriaSelecionada: 'Todos');

      expect(controller.anunciosFiltrados.length, anunciosMock.length);
      expect(controller.anunciosVisiveis.length, 3); // paginação
    });

    test('Deve filtrar apenas Automóveis', () {     
      final controller = AnuncioController(itensPorPagina: 5);            //teste para a categoria autonoveis
      controller.atualizarLista(categoriaSelecionada: 'Automoveis');

      final soAutomoveis = controller.anunciosFiltrados.every((a) => a['tipo'] == 'Automoveis');
      expect(soAutomoveis, true);
    });

    test('Deve buscar por termo no título', () {
      final controller = AnuncioController(itensPorPagina: 5);    //teste para a busca por texto
      controller.atualizarLista(termoBusca: 'notebook');

      final soNotebooks = controller.anunciosFiltrados.every(
        (a) => (a['titulo'] as String).toLowerCase().contains('notebook'),
      );
      expect(soNotebooks, true);
    });

    test('Deve carregar mais itens', () {     
      final controller = AnuncioController(itensPorPagina: 5);    //Teste de carregar mais itens
      controller.atualizarLista(categoriaSelecionada: 'Todos');

      final antes = controller.anunciosVisiveis.length;
      controller.carregarMais();
      final depois = controller.anunciosVisiveis.length;

      expect(depois, greaterThan(antes));
    });
  });
}