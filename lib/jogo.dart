// ignore_for_file: prefer_final_fields, prefer_const_constructors, unnecessary_this

import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _mensagem = "Escolha uma opção abaixo";
  var _imagemapp = AssetImage("imagens/padrao.png");
  void opcSelect(int escolha) {
    var opcao = [1, 2, 3];
    var numero = Random().nextInt(3);
    var ecolhaApp = opcao[numero];

    switch (ecolhaApp) {
      case 0:
        setState(() {
          _imagemapp = AssetImage("imagens/pedra.png");
        });
        break;
      case 1:
        setState(() {
          _imagemapp = AssetImage("imagens/papel.png");
        });
        break;
      case 2:
        setState(() {
          _imagemapp = AssetImage("imagens/tesoura.png");
        });
        break;
    }
    if ((escolha == 0 && ecolhaApp == 2) ||
        (escolha == 2 && ecolhaApp == 1) ||
        (escolha == 1 && ecolhaApp == 0)) {
      setState(() {
        _mensagem = "Parabéns você ganhou ! ";
      });
    } else if ((ecolhaApp == 0 && escolha == 2) ||
        (ecolhaApp == 2 && escolha == 1) ||
        (ecolhaApp == 1 && escolha == 0)) {
      setState(() {
        _mensagem = "Você perdeu ! :(";
      });
    } else {
      setState(() {
        _mensagem = "Deu empate ! ";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.all(2),
          child: Text(
            "JokenPo",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 20),
            child: Text(
              "Escolha do APP : ",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        Image(image: _imagemapp),
        Padding(
          padding: EdgeInsets.only(top: 32, bottom: 20),
          child: Text(this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: () => opcSelect(0),
                child: Image.asset("imagens/pedra.png", width: 100)),
            GestureDetector(
                onTap: () => opcSelect(1),
                child: Image.asset("imagens/papel.png", width: 100)),
            GestureDetector(
                onTap: () => opcSelect(2),
                child: Image.asset("imagens/tesoura.png", width: 100))
          ],
        )
      ]),
    );
  }
}
