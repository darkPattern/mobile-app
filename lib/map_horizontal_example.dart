import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FullScreenImageDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black, // Set the background color of the screen
        child: Stack(
          children: [
            GestureDetector(
              onDoubleTap: () {
                launchUrl(Uri.parse("https://dice-game-davinasd.vercel.app/"));

                // Action when the first image is tapped
                print('First image tapped');
                // Add your action here when the first image is pressed
              },
              child: Image.asset(
                'assets/drawable/map_vertical_point.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            GestureDetector(
              onTap: () {
                launchUrl(Uri.parse("https://yuri-becker.github.io/react-jigsaw-puzzle/"));
                print('Second image tapped');
                // Add your action here when the second image is pressed
              },
              onDoubleTap: () {
                launchUrl(Uri.parse("https://dice-game-davinasd.vercel.app/"));

                // Action when the first image is tapped
                print('First image tapped');
                // Add your action here when the first image is pressed
              },
              child: Image.asset(
                'assets/drawable/map_vertical.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            // Add more GestureDetector widgets for additional images in the Stack
          ],
        ),
      ),
    );
  }
}


