import 'package:animations_menu/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'menu_dashboard_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Color backgroundColur = ColorsConst().backgroundColur;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: backgroundColur,
    statusBarIconBrightness: Brightness.light,
  ));

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Dashboard',
      home: MenuDashboard(),
    );
  }
}
