import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kodikon/map_horizontal_example.dart';
import 'package:kodikon/screens/Articles%20-%20SafeCarousel/AllArticles.dart';
import 'package:kodikon/screens/Articles%20-%20SafeCarousel/SafeCarousel.dart';
import 'package:kodikon/screens/Emergency.dart';
import 'package:kodikon/screens/LiveSafeSpots/BusStationCard.dart';
import 'package:kodikon/screens/LiveSafeSpots/HospitalCard.dart';
import 'package:kodikon/screens/LiveSafeSpots/PharmacyCard.dart';
import 'package:kodikon/screens/LiveSafeSpots/PoliceStationCard.dart';
import 'package:kodikon/screens/reminder/pages/homepage/index.dart';

import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int quoteIndex = 0;
  @override
  void initState() {
    super.initState();
    getRandomInt(false);
  }

  getRandomInt(fromClick) {
    Random rnd = Random();

    quoteIndex = rnd.nextInt(4);
    if (mounted && fromClick) {
      setState(() {});
    }
  }

  final List<Widget> items = [
    _buildCarouselItem(Colors.blue, 'assets/icons/mindfulness.png'),
    _buildCarouselItem(Colors.red, 'lib/assets/icons/notes.png'),
    // Add more items as needed
  ];

  static Widget _buildCarouselItem(Color color, String imagePath) {
    return Container(
      height: 100,
      color: color,
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        height: 50,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = 170.0;
    final double itemWidth = size.width / 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // DashAppbar(
        //   getRandomInt: getRandomInt,
        //   quoteIndex: quoteIndex,
        // ),
        Expanded(
          child: Container(
            child: ListView(
              shrinkWrap: true,
              children: [
                SafeCarousel(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Emergency",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllArticles(),
                            ),
                          );
                        },
                        child: Text("See More"),
                      ),
                    ],
                  ),
                ),
                Emergency(),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, bottom: 10, top: 10),
                  child: Text(
                    "Explore LiveSafe",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                LiveSafe(),
                SizedBox(
                  height: 50,
                ),
                SpecialistsGrid(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LiveSafe extends StatelessWidget {
  const LiveSafe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: ListView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          children: [
            PoliceStationCard(openMapFunc: openMap),
            HospitalCard(openMapFunc: openMap),
            PharmacyCard(openMapFunc: openMap),
            BusStationCard(openMapFunc: openMap)
          ]),
    );
  }

  static Future<void> openMap(String location) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$location';

    try {
      await launch(googleUrl);
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: "Something went wrong! Call emergency numbers.");
    }
    // if (await canLaunch(googleUrl)) {
    //   await launch(googleUrl);
    // } else {
    //   throw 'Could not open the map.';
    // }
  }
}

class SpecialistsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<SpecialistItem> specialistItems = [
      SpecialistItem(
        id: '1',
        name: 'Mindfulness',
        image: 'assets/icons/mindfulness.png',
        onChanged: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FullScreenImageDisplay()));
        },
      ),
      SpecialistItem(
        id: '2',
        name: 'Pill Calendar',
        image: 'assets/images/urgent.png',
        onChanged: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage1()));
        },
      ),
      // Add more SpecialistItem instances as needed
    ];

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 1.0,
      controller: ScrollController(keepScrollOffset: false),
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 8.0,
      children: List.generate(specialistItems.length, (index) {
        return GestureDetector(
          onTap: () {
            specialistItems[index]
                .onChanged(); // Trigger the onChanged function
          },
          child: Card(
            elevation: 1.0,
            shadowColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.5),
                          offset: Offset(0, 3),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        specialistItems[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    specialistItems[index].name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      fontFamily: 'medium',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class SpecialistItem {
  final String id;
  final String name;
  final String image;
  final Function onChanged;

  SpecialistItem({
    required this.id,
    required this.name,
    required this.image,
    required this.onChanged,
  });
}
