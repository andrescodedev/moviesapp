import 'package:flutter/material.dart';
import 'package:prueba_imaginamos/src/blocs/movie_bloc.dart';
import 'package:prueba_imaginamos/src/ui/widgets/movieplaying_list_widget.dart';
import 'package:prueba_imaginamos/src/ui/widgets/section_menu_widget.dart';

class ContainerHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Container(
        height: deviceSize.height * 0.7,
        width: deviceSize.width,
        padding: EdgeInsets.only(top: 30.0, left: 5.0),
        decoration: BoxDecoration(
            color: Color(0xff2C3848),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionMenuWidget(
              section: 'RECOMMENDED FOR YOU',
            ),
            SizedBox(
              height: 10.0,
            ),
            Flexible(
              child: MovieplayingListWidget(
                observable: bloc.moviesPlaying,
              ),
            ),
            SectionMenuWidget(
              section: 'TOP RATED',
            ),
            SizedBox(
              height: 10.0,
            ),
            Flexible(
              child: MovieplayingListWidget(
                observable: bloc.moviesPopular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
