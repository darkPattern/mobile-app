import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kodikon/constants.dart';
import 'package:kodikon/provider/auth_provider.dart';
import 'package:kodikon/provider/upload_provider.dart';
import 'package:kodikon/screens/main_class.dart';
import 'package:kodikon/screens/slider.dart';

import 'package:provider/provider.dart';

import '../screens/splash.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: AuthProvider(''),
          ),
          ChangeNotifierProxyProvider<AuthProvider, FileUploadProvider>(
            create: (ctx) => FileUploadProvider(),
            update: (ctx, auth, _) => FileUploadProvider(),
          ),
        ],
        child: Consumer<AuthProvider>(
            builder: (ctx, auth, _) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'MyShop',
              theme: ThemeData(
                textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
                scaffoldBackgroundColor: kBackgroundColor,
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
                  home: FutureBuilder(
                    future: auth.tryAutoLogin(), // Await the result here
                    builder: (ctx, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SplashPage();
                      } else {
                        if (snapshot.data == true) {
                          return const MainScreen();
                        } else {
                          return slider();
                        }
                      }
                    },
                  ),
                )));
  }
}
