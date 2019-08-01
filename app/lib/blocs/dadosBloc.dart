import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

class DadosBloc implements BlocBase {


  // Controller com dados básicos do usuário
  final _userController = StreamController();

  Stream get outUser => _userController.stream;
  Sink get inUser => _userController.sink;

  // Controller com dados do chat
  final _chatController = StreamController();

  //Stream get outChat => _chatController.stream;
  Sink get inChat => _chatController.sink;
  

  DadosBloc(){
    //_chatController.stream.listen(updateChat);
  }

  

  @override
  void dispose() {
    // TODO: implement dispose
    _userController.close();
    _chatController.close();
  }

}