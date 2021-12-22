import 'package:http/http.dart';
import 'package:magichiberus/domain/entities/carta_entitie.dart';

abstract class ICartasRepositorio {

  Future<Response> getAllCartasRepo();
  Future<Response> getCartaByIdRepo(int id);
  Future<Response> getCartaByNameRepo(String name);
}