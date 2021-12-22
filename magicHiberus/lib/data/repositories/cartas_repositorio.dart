import 'package:magichiberus/data/repositories/APIEndPoints.dart';
import 'package:magichiberus/domain/entities/carta_entitie.dart';
import 'package:magichiberus/domain/repositories/icartas_repositorio.dart';

import 'package:http/http.dart' as http;

class CartasRepositorio implements ICartasRepositorio{

  @override
  Future<http.Response> getAllCartasRepo() async {
    return await http.get(Uri.parse(getURLAllCards()));
  }

  @override
  Future<http.Response> getCartaByIdRepo(int id) async {
    return await http.get(Uri.parse(getURLCardsById(id)));
  }

  @override
  Future<http.Response> getCartaByNameRepo(String name) async {
    return await http.get(Uri.parse(getURLCardsByName(name)));
  }
}