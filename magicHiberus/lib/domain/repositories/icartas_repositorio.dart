import 'package:http/http.dart';

abstract class ICartasRepositorio {

  Future<Response> getAllCartasRepo();
  Future<Response> getCartaByIdRepo(int id);
  Future<Response> getCartaByNameRepo(String name);
}