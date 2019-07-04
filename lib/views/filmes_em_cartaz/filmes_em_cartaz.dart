import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/shared/constants.dart';
import 'package:movies_app/shared/models/filme.dart';
import 'package:movies_app/shared/repository/filmes_repository.dart';
import 'package:movies_app/shared/shared_widgets/avaliacao.dart';
import 'package:movies_app/views/filme/filme.dart';

class FilmesEmCartazPage extends StatefulWidget {
  FilmesEmCartazPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FilmesEmCartazPageState createState() => _FilmesEmCartazPageState();
}

class _FilmesEmCartazPageState extends State<FilmesEmCartazPage> {
  TextStyle mainTitle = TextStyle(color: Colors.white);
  TextStyle titleStyle =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white);
  TextStyle subtituloStyle = TextStyle(
      fontSize: 17, fontWeight: FontWeight.normal, color: Colors.black);

  Widget posterFilme(Filme filme) {
    return Container(
        width: 100,
        height: 100,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: Image.network(URL_POSTER + filme.posterPath)));
  }

  Widget filmeEmCartaz(Filme filme) {
    return GestureDetector(
      onDoubleTap: () => {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                // return object of type Dialog
                return new AlertDialog(
                  title: new Text("Dialog Title"),
                  content: new Text("This is my content"),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("Close"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    // CupertinoDialogAction(
                    //   isDefaultAction: true,
                    //   child: Text("Yes"),
                    // ),
                    // CupertinoDialogAction(
                    //   child: Text("No"),
                    // )
                  ],
                );
              },
            )

            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     // return object of type Dialog
            //     return AlertDialog(
            //       title: new Text("Alert Dialog title"),
            //       content: new Text("Alert Dialog body"),
            //       actions: <Widget>[
            //         // usually buttons at the bottom of the dialog
            // new FlatButton(
            //   child: new Text("Close"),
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            // ),
            //       ],
            //     );
            //   },
            // )
          },
      onTap: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return FilmePage(filme: filme);
            }))
          },
      child: Container(
        child: Card(
          color: Colors.blueGrey,
          child: Row(
            children: <Widget>[
              posterFilme(filme),
              Expanded(
                child: ListTile(
                    title: Text(filme.title, style: titleStyle),
                    subtitle: Column(
                      children: <Widget>[
                        AvaliacaoFilme(qtdeEstrelas: filme.voteAverage),
                        new Text(
                            (filme.overview.length < 80)
                                ? filme.overview
                                : filme.overview.substring(0, 80) + "...",
                            style: subtituloStyle)
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(widget.title, style: mainTitle),
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
          return Center(child: CupertinoActivityIndicator());
        },
      ),
    );
  }
}
