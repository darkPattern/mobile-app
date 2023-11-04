import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kodikon/constants.dart';
import 'package:kodikon/screens/reminder/router/routes.dart';
import 'package:kodikon/src/config/route.dart';
import 'package:kodikon/src/theme/theme.dart';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'screens/splash.dart';





Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = (await getApplicationDocumentsDirectory()).path;
  File('$dir/data.json').writeAsStringSync('');
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      locked: true,
      channelKey: 'pill_channel',
      channelName: 'Pill Reminder',
      defaultColor: const Color(0xff020202),
      importance: NotificationImportance.High,
      channelShowBadge: true,
      channelDescription: 'Description',
    ),
  ]);
  await AwesomeNotifications().requestPermissionToSendNotifications();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MyShop',
        initialRoute: RouteManager.homePage,
        onGenerateRoute: RouteManager.generateRoute,
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
