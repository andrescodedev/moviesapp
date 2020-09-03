import 'package:flutter/material.dart';
import 'package:prueba_imaginamos/src/ui/widgets/container_home_widget.dart';
import 'package:prueba_imaginamos/src/ui/widgets/search_field_widget.dart';
import 'package:prueba_imaginamos/src/ui/widgets/title_home_widget.dart';

class MovieHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5CA0D3),
      body: SafeArea(
        child: Column(
          children: [
            TitleHomeWidget(
              title: 'Hello, what do you want to watch ?',
              fontSize: 30.0,
            ),
            SearchFieldWidget(),
            ContainerHomeWidget(),
          ],
        ),
      ),
    );
  }
}
