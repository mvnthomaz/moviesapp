import 'package:flutter/material.dart';
import 'package:movies_app/shared/constants.dart';
import 'package:movies_app/shared/models/filme.dart';
import 'package:movies_app/shared/repository/filmes_repository.dart';

class FilmesEmCartazPage extends StatefulWidget {
  FilmesEmCartazPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FilmesEmCartazPageState createState() => _FilmesEmCartazPageState();
}

class _FilmesEmCartazPageState extends State<FilmesEmCartazPage> {
  TextStyle tituloStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  TextStyle subtituloStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.normal);

  Widget quantidadeEstrelaFilme(Filme filme) {
    double qtde = filme.voteAverage / 2;

    const double starSize = 25;
    return Row(
      children: <Widget>[
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: starSize,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: starSize,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: starSize,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: starSize,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: starSize,
        )
      ],
    );
  }

  Widget filmeEmCartaz(Filme filme) {
    return Container(
      height: 200,
      child: Card(
        child: ListTile(
            title: Text(filme.title, style: tituloStyle),
            leading: Container(
              height: 100,
              child: Image.network(URL_POSTER + filme.posterPath),
            ),
            subtitle: Column(
              children: <Widget>[
                quantidadeEstrelaFilme(filme),
                new Text((filme.overview.length < 80)
                    ? filme.overview
                    : filme.overview.substring(0, 80) + "...", style: subtituloStyle)
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: FutureBuilder<List<Filme>>(
        future: fetchFilmes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Filme> filme = snapshot.data;
            return ListView.builder(
              itemCount: filme.length,
              itemBuilder: (BuildContext context, int index) {
                return filmeEmCartaz(filme[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // Animação loading
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
