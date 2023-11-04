import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kodikon/screens/register_page.dart';
import 'package:kodikon/screens/signin_page.dart';
import '../constants.dart';
import '../widgets/widget.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Flexible(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const Image(
                          image:
                              AssetImage('assets/images/team_illustration.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Never Forget a Pill\n with TabMind",
                      style: kHeadline,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Text(
                        "Simplify your medication routine. TabMind provides gentle reminders and easy tracking, ensuring you or your loved ones stay on top of their health. Get started today!",
                        style: kBodyText,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: MyTextButton(
                      bgColor: Colors.white,
                      buttonName: 'Register',
                      textColor: Colors.black87,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => RegisterPage()),
                        );
                      },
                    ),
                  ),
                  // const SizedBox(width: 20),
                  // Expanded(
                  //   child: MyTextButton(
                  //     bgColor: Colors.transparent,
                  //     buttonName: 'Sign In',
                  //     textColor: Colors.white,
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(builder: (_) => SignInPage()),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
