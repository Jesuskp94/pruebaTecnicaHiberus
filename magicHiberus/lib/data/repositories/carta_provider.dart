import 'package:flutter/cupertino.dart';

class CardsProvider extends ChangeNotifier{
  List<Card> listaCartas = [];
  
  CardsProvider(){
    print("Estamos en el constructor");
    this.getAllCards();
  }
  
  getAllCards() async{
    var urlMagicAPI = Uri.parse('http')
    
  }
  
}