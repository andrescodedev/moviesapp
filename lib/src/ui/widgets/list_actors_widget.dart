import 'package:flutter/material.dart';
import 'package:prueba_imaginamos/src/blocs/credit_bloc.dart';
import 'package:prueba_imaginamos/src/models/credit_model.dart';
import 'package:prueba_imaginamos/src/models/movie_model.dart';

class ListActorsWidget extends StatefulWidget {
  final Result movie;

  ListActorsWidget({this.movie});

  @override
  _ListActorsWidgetState createState() => _ListActorsWidgetState();
}

class _ListActorsWidgetState extends State<ListActorsWidget> {
  CreditBloc creditBloc;

  @override
  void didChangeDependencies() {
    creditBloc = CreditBloc();
    creditBloc.getActors(widget.movie.id);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    creditBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: creditBloc.actors,
      builder: (BuildContext context, AsyncSnapshot<CreditModel> snapshot) {
        if (snapshot.hasData) {
          List<Actor> actors = snapshot.data.results;

          return SizedBox(
            height: 130.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: PageView.builder(
                itemCount: actors.length,
                controller:
                    PageController(initialPage: 1, viewportFraction: 0.3),
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final actor = actors[index];

                  return Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 40.0,
                        minRadius: 30.0,
                        backgroundImage: NetworkImage(
                          '${actor.getPhotoActor()}',
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 70.0,
                          maxHeight: 30.0,
                        ),
                        child: Text(
                          '${actor.name}',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 12.0),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Lo sentimos, no se cargaron los actores');
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
