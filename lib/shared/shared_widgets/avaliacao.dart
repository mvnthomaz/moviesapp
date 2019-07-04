import 'package:flutter/material.dart';

class AvaliacaoFilme extends StatelessWidget {
  static final double TAMANHO_ESTRELA = 25;
  final double qtdeEstrelas;

  const AvaliacaoFilme({Key key, this.qtdeEstrelas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Row(
      children: <Widget>[
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: TAMANHO_ESTRELA,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: TAMANHO_ESTRELA,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: TAMANHO_ESTRELA,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: TAMANHO_ESTRELA,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: TAMANHO_ESTRELA,
        )
      ],
    );

  }
}