import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_imaginamos/src/theme/theme_mode.dart';

class TitleHomeWidget extends StatelessWidget {
  final String title;
  final double fontSize;

  TitleHomeWidget({this.title, this.fontSize});

  @override
  Widget build(BuildContext context) {
    final themeModeApp = Provider.of<ThemeModeApp>(context);

    return Padding(
      padding:
          EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0, top: 10.0),
      child: Row(
        children: [
          Switch.adaptive(
            activeColor: Theme.of(context).toggleableActiveColor,
            value: themeModeApp.getDarkTheme,
            onChanged: (value) => themeModeApp.setDarkTheme = value,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 250.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
