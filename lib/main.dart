import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_player/modules/detail_audiopage.dart';
import 'package:music_player/style/colors.dart'as colors;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: colors.audioBluishBackground,
        appBarTheme:const AppBarTheme(
          backwardsCompatibility: false,
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          )
        ),
      ),
      home:DetailAudioPage(),
    );
  }
}
