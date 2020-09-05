import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_imaginamos/src/theme/theme_mode.dart';
import 'package:prueba_imaginamos/src/ui/widgets/movieplaying_list_widget.dart';
import 'package:prueba_imaginamos/src/ui/widgets/moviepopular_list_widget.dart';
import 'package:prueba_imaginamos/src/ui/widgets/section_menu_widget.dart';

class ContainerHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    final themeModeApp = Provider.of<ThemeModeApp>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 130.0),
      child: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        padding: EdgeInsets.only(top: 30.0, left: 5.0),
        decoration: BoxDecoration(
            color: (themeModeApp.getDarkTheme)
                ? Theme.of(context).backgroundColor
                : Color(0xff2C3848),
            //color: Color(0xff2C3848),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0))),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionMenuWidget(
              section: 'RECOMMENDED FOR YOU',
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: MovieplayingListWidget(),
              flex: 1,
            ),
            SectionMenuWidget(
              section: 'TOP RATED',
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: MoviepopularListWidget(),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
