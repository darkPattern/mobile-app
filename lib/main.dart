import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kodikon/constants.dart';
import 'package:kodikon/src/config/route.dart';
import 'package:kodikon/src/theme/theme.dart';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/splash.dart';





Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MyShop',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          scaffoldBackgroundColor: kBackgroundColor,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

            home:  SplashPage()
    );
  }
}
