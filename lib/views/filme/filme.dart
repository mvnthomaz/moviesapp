import 'package:flutter/material.dart';
import 'package:movies_app/shared/constants.dart';
import 'package:movies_app/shared/models/filme.dart';
import 'package:movies_app/shared/shared_widgets/arc_image.dart';
import 'package:movies_app/shared/shared_widgets/avaliacao.dart';

class FilmePage extends StatefulWidget {
  final Filme filme;

  const FilmePage({Key key, this.filme}) : super(key: key);

  @override
  _FilmePageState createState() => _FilmePageState();
}

class _FilmePageState extends State<FilmePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Container(
        child: Stack(
          children: <Widget>[
            ArcBannerImage(URL_BACKDROP + widget.filme.posterPath),
            Positioned(
              left: 32,
              top: 130,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 200,
                    child: Image.network(URL_POSTER + widget.filme.posterPath),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: <Widget>[
                      Text(widget.filme.title),
                      AvaliacaoFilme(qtdeEstrelas: widget.filme.voteAverage / 2)
                    ],
                  )
                  //Expanded(child: Text(widget.filme.title))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
