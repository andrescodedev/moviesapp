import 'package:flutter/material.dart';
import 'package:prueba_imaginamos/src/ui/widgets/container_home_widget.dart';
import 'package:prueba_imaginamos/src/ui/widgets/drawer_menu_widget.dart';
import 'package:prueba_imaginamos/src/ui/widgets/search_field_widget.dart';
import 'package:prueba_imaginamos/src/ui/widgets/title_home_widget.dart';

class MovieHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenuWidget(),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                TitleHomeWidget(
                  title: 'Hello, what do you want to watch ?',
                  fontSize: 30.0,
                ),
                SearchFieldWidget(),
              ],
            ),
            Positioned(
              child: ContainerHomeWidget(),
              top: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
