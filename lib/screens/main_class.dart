import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kodikon/screens/bio.dart';
import 'package:kodikon/screens/health_data.dart';
import 'package:kodikon/screens/homescreen.dart';
import 'package:kodikon/screens/register_page.dart';
import 'package:kodikon/screens/reminder/pages/homepage/index.dart';
import 'package:kodikon/screens/upload.dart';
import 'package:kodikon/screens/welcome_page.dart';
import 'package:kodikon/src/pages/home_page.dart';

import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWithCardsScreen extends StatefulWidget {
  @override
  _CarouselWithCardsScreenState createState() => _CarouselWithCardsScreenState();
}

class _CarouselWithCardsScreenState extends State<CarouselWithCardsScreen> {
  final List<String> list_of_tablets = [
    'Tablet 1',
    'Tablet 2',
    'Tablet 3',
    // Add more tablet names
  ];

  final List<String> list_of_dosages = [
    'Dosage 1',
    'Dosage 2',
    'Dosage 3',
    // Add more dosage texts
  ];

  final List<String> imageUrls = [
    "https://images.freeimages.com/images/large-previews/4c0/aspirin-2-1496974.jpg",
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.drugs.com%2Fimages%2Fpills%2Fmtm%2F597620156_PB.jpg&f=1&nofb=1&ipt=a97e4ac966cc3cc610aa444aa93003a2ad592d81f74c2e5e03256d303110cdc2&ipo=images',
"https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.shop-apotheke.com%2Fimages%2Fmetformin-hexal-1000-mg-filmtabletten-D02937550-p10.jpg&f=1&nofb=1&ipt=49addce23d613cce70b4a798dec15cf0efe12b728b19db36ffa9dc84d203a837&ipo=images",
"https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.kalpa-pharmaceuticals.org%2Fwp-content%2Fuploads%2Fmetformin.jpg&f=1&nofb=1&ipt=c79a52d178fcfb0b82a6646db0da8f764c9ba577135b0a0a90dbbef8da8738ab&ipo=images",
"https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Flh6.googleusercontent.com%2FXHjrqcR9fImKIEbbowAuqBdlxy2WylEwQWFfvA6i8JOVjCX5K-aseTvugGuWfglm3302B3N8uoWtxEnCczrUIvQVqrQwe5Th-6jOkMdXNSTLVL3CnLRCf3HrF-GreJjtP9VxKUCN&f=1&nofb=1&ipt=478576cdd857200d8b47a8b87efc8e870b1b5da178022f57b232ce2b26b48712&ipo=images",
"https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Flh6.googleusercontent.com%2FXHjrqcR9fImKIEbbowAuqBdlxy2WylEwQWFfvA6i8JOVjCX5K-aseTvugGuWfglm3302B3N8uoWtxEnCczrUIvQVqrQwe5Th-6jOkMdXNSTLVL3CnLRCf3HrF-GreJjtP9VxKUCN&f=1&nofb=1&ipt=478576cdd857200d8b47a8b87efc8e870b1b5da178022f57b232ce2b26b48712&ipo=images",

  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: <Widget>[
          Expanded(
            child: CarouselSlider.builder(
              itemCount: list_of_tablets.length,
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: MediaQuery.of(context).size.height,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              itemBuilder: (context, index, realIdx) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        list_of_tablets[index],
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.network(imageUrls[index % imageUrls.length],height: 200,),
                      Image.network(imageUrls[(index + 1) % imageUrls.length],height: 200,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          list_of_dosages[index],
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list_of_tablets.asMap().entries.map((entry) {
              return GestureDetector(
                //onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late final PageController _c = PageController(
    initialPage: 0,
  );

  double offset = 0.0;
  static final _isInit = true;
  static final _isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _onItemTapped(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_c.hasClients) {
        _c.animateToPage(index,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut);

        setState(() {
          _selectedIndex = index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));
    List<String> headers = ["Home", "Upload", "Y"];

    List<Widget> _widgetOptions = <Widget>[
      Home(),
      Upload(),
      HealthApp(),
      CarouselWithCardsScreen(),


    ];

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            _showLogoutAlert(context);
            // controller.toggle();
          },
        ),
      ),
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: PageView.builder(
              itemCount: _widgetOptions.length,
              controller: _c,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Center(child: _widgetOptions.elementAt(index));
              }),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Color.fromRGBO(0, 13, 48, 1),
            ),
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 6.0,
                    children: [
                      _selectedIndex == 0
                          ? Column(
                              children: [
                                ImageIcon(
                                  Image.asset('assets/icons/health.png')
                                      .image,
                                  size: 24.0,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: const EdgeInsets.only(top: 5),
                                  height: 2,
                                  width: 12.0,
                                ),
                              ],
                            )
                          : ImageIcon(
                              Image.asset('assets/icons/health.png')
                                  .image,
                              size: 24.0,
                            ),
                      _selectedIndex == 0
                          ? const Text(
                              '',
                              style: TextStyle(fontSize: 14.0),
                            )
                          : const Text(''),
                    ],
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 6.0,
                    children: [
                      _selectedIndex == 1
                          ? Column(
                              children: [
                                ImageIcon(
                                  Image.asset('assets/icons/upload.png').image,
                                  size: 24.0,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: const EdgeInsets.only(top: 5),
                                  height: 2,
                                  width: 12.0,
                                ),
                              ],
                            )
                          //background: rgba(246, 220, 220, 1);
                          : ImageIcon(
                              Image.asset('assets/icons/upload.png').image,
                              size: 24.0,
                            ),
                    ],
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 6.0,
                    children: [
                      _selectedIndex == 2
                          ? Column(
                              children: [
                                ImageIcon(
                                  Image.asset('assets/icons/bio.png').image,
                                  size: 24.0,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: const EdgeInsets.only(top: 5),
                                  height: 2,
                                  width: 12.0,
                                ),
                              ],
                            )
                          : ImageIcon(
                              Image.asset('assets/icons/bio.png').image,
                              size: 24.0,
                            ),
                      _selectedIndex == 2
                          ? const Text(
                              '',
                              style: TextStyle(fontSize: 14.0),
                            )
                          : const Text(''),
                    ],
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 6.0,
                    children: [
                      _selectedIndex == 3
                          ? Column(
                        children: [
                          ImageIcon(
                            Image.asset('assets/icons/bio.png').image,
                            size: 24.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.only(top: 5),
                            height: 2,
                            width: 12.0,
                          ),
                        ],
                      )
                          : ImageIcon(
                        Image.asset('assets/icons/bio.png').image,
                        size: 24.0,
                      ),
                      _selectedIndex == 3
                          ? const Text(
                        '',
                        style: TextStyle(fontSize: 14.0),
                      )
                          : const Text(''),
                    ],
                  ),
                  label: "",
                ),
              ],
              currentIndex: _selectedIndex,
              showUnselectedLabels: false,
              selectedLabelStyle: const TextStyle(fontSize: 0.0),
              unselectedLabelStyle: const TextStyle(fontSize: 0.0),
              unselectedIconTheme:
                  const IconThemeData(color: Colors.white, size: 20.0),
              selectedIconTheme: const IconThemeData(color: Colors.white),
              onTap: _onItemTapped,
              backgroundColor: Color.fromRGBO(0, 13, 48, 1),
              // backgroundColor: Colors.black,
              fixedColor: Color.fromRGBO(0, 13, 48, 1),
            ),
          ),
        ),
      ),
    );
  }
}

//
// class Menu extends StatefulWidget {
//   @override
//   _MenuState createState() => _MenuState();
// }
//
// class _MenuState extends State<Menu> with TickerProviderStateMixin {
//   late AnimationController _animationController;
//   late SimpleHiddenDrawerController _controller;
//
//   @override
//   void initState() {
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 300),
//     );
//     super.initState();
//   }
//
//   @override
//   void didChangeDependencies() {
//     _controller = SimpleHiddenDrawerController.of(context);
//     _controller.addListener(() {
//       if (_controller.state == MenuState.open) {
//         _animationController.forward();
//       }
//
//       if (_controller.state == MenuState.closing) {
//         _animationController.reverse();
//       }
//     });
//     super.didChangeDependencies();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       height: double.maxFinite,
//       color: Colors.cyan,
//       child: Stack(
//         children: <Widget>[
//           Container(
//             width: double.maxFinite,
//             height: double.maxFinite,
//             child: Image.network(
//               'https://wallpaperaccess.com/full/529044.jpg',
//               fit: BoxFit.cover,
//             ),
//           ),
//           FadeTransition(
//             opacity: _animationController,
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     SizedBox(
//                       width: 200.0,
//                       child: ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor:
//                           MaterialStateProperty.all(Colors.blue),
//                           shape: MaterialStateProperty.all(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(
//                                   20.0,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         onPressed: () {
//                           _controller.setSelectedMenuPosition(0);
//                         },
//                         child: Text(
//                           "Menu 1",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 200.0,
//                       child: ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor:
//                           MaterialStateProperty.all(Colors.orange),
//                           shape: MaterialStateProperty.all(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(
//                                   20.0,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         onPressed: () {
//                           _controller.setSelectedMenuPosition(1);
//
//                         },
//                         child: Text(
//                           "Logout",
//                           style: TextStyle(color: Colors.white),
//
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

void _showLogoutAlert(BuildContext context) {
  var alertStyle = AlertStyle(
    animationType: AnimationType.fromBottom,
    isCloseButton: false,
    isOverlayTapDismiss: true,
    descStyle: const TextStyle(fontFamily: "regular", fontSize: 14),
    descTextAlign: TextAlign.start,
    animationDuration: const Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: const BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: const TextStyle(
        color: Colors.black, fontFamily: "medium", fontSize: 16),
    alertAlignment: Alignment.center,
  );
  Future.delayed(const Duration(milliseconds: 300), () {
    Alert(
      context: context,
      style: alertStyle,
      title: "SpeakOut!!",
      desc: "Are you sure ?",
      buttons: [
        DialogButton(
          border: const Border.fromBorderSide(
              BorderSide(color: Colors.black, width: 1)),
          color: Colors.transparent,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          width: 120,
          child: const Text(
            "Cancel",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontFamily: "lato"),
          ),
        ),
        DialogButton(
          color: Colors.transparent,
          border: const Border.fromBorderSide(
              BorderSide(color: Colors.red, width: 1)),
          onPressed: () async {
            Navigator.of(context, rootNavigator: true).pop();

            // final profile = Provider.of<UserProvider>(context);
            //  profile.profileStatus(false);

            SharedPreferences prefs = await SharedPreferences.getInstance();

            prefs.clear().then((value) {
              if (value) {
                Future.delayed(const Duration(milliseconds: 800), () {
                  Navigator.of(context).pushAndRemoveUntil(
                    // the new route
                    MaterialPageRoute(
                      builder: (BuildContext context) => WelcomePage(),
                    ),

                    // this function should return true when we're done removing routes
                    // but because we want to remove all other screens, we make it
                    // always return false
                    (Route route) => false,
                  );
                });
              }
            });
          },
          width: 120,
          child: const Text(
            "LOGOUT",
            style: TextStyle(
                color: Colors.red, fontSize: 16, fontFamily: "medium"),
          ),
        )
      ],
    ).show();
  });
}
