import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_imaginamos/src/theme/theme_mode.dart';

class DrawerMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeModeApp = Provider.of<ThemeModeApp>(context);

    return Drawer(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Dark Mode',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Switch.adaptive(
                activeColor: Theme.of(context).toggleableActiveColor,
                value: themeModeApp.getDarkTheme,
                onChanged: (value) => themeModeApp.setDarkTheme = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
