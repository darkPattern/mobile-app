import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kodikon/constants.dart';
import 'package:kodikon/screens/welcome_page.dart';
import 'package:lottie/lottie.dart';

class slider extends StatefulWidget {
  slider({Key? key}) : super(key: key);

  static const String page_id = "Slider";

  @override
  _sliderState createState() => _sliderState();
}

class _sliderState extends State<slider> {
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: const BoxDecoration(

      ),
      child: Stack(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              onPageChanged: ((index, reason) {
                setState(() {
                  _currentIndex = index;
                  print(index);
                });
              }),
              height: double.infinity,
              viewportFraction: 1.0,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: false,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            carouselController: _controller,
            items: [1, 2, 3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (i == 1)
                            _buildSlide1()
                          else if (i == 2)
                            _buildSlide3()
                          else if (i == 3)
                          _buildSlide2()

                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSlide1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 300,
          width: 300,
          child: ClipPath(
            child: ClipRRect(
              child: Lottie.network(
                'https://lottie.host/71d2e79d-26f6-4a15-bcdc-dc0a287e1831/6DTx32Pwaa.json',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                'Register',
                textAlign: TextAlign.center,
                style: whiteHeadText(),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Register By Entering Your Basic Information',
                  style: simpleWhiteText(),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.circle,
                    size: 15,
                    color: Colors.white,
                  ),
                  const Icon(
                    Icons.circle,
                    size: 15,
                    color: Colors.white60,
                  ),
                  const Icon(
                    Icons.circle,
                    size: 15,
                    color: Colors.white60,
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  WelcomePage()));
                },
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xffbbebff), Colors.indigo],
                    ),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 300.0,
                      minHeight: 50.0,
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      constraints: const BoxConstraints(
                        maxWidth: 300.0,
                        minHeight: 50.0,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'GET STARTED',
                        style: TextStyle(fontFamily: 'bold', fontSize: 16),
                      ),
                    ),
                  ),
                ),
                style: blueButton(),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildSlide2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 300,
          width: 300,
          child: ClipPath(
            child: ClipRRect(
              child: Lottie.network(
                'https://lottie.host/40fbbd2a-85e3-48fd-8c4f-d6cd7b2cf004/hknVW4muZI.json',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                'Select',
                textAlign: TextAlign.center,
                style: whiteHeadText(),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Get Timely Notified',
                  style: simpleWhiteText(),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.circle,
                    size: 15,
                    color: Colors.white60,
                  ),
                  const Icon(
                    Icons.circle,
                    size: 15,
                    color: Colors.white,
                  ),
                  const Icon(
                    Icons.circle,
                    size: 15,
                    color: Colors.white60,
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  WelcomePage()));
                },
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xffbbebff), Colors.indigo],
                    ),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 300.0,
                      minHeight: 50.0,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'GET STARTED',
                      style: TextStyle(fontFamily: 'bold', fontSize: 16),
                    ),
                  ),
                ),
                style: blueButton(),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildSlide3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 300,
          width: 300,
          child: ClipPath(
            child: ClipRRect(
              child: Lottie.network(
                'https://lottie.host/0e0ee6e7-21fe-4a64-8a8c-ad84194300e5/PyAN63vkpg.json',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                'Effortless ',
                textAlign: TextAlign.center,
                style: whiteHeadText(),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Effortlessly Upload Sketch App User Interfaces',
                  style: simpleWhiteText(),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.circle,
                    size: 15,
                    color: Colors.white60,
                  ),
                  const Icon(
                    Icons.circle,
                    size: 15,
                    color: Colors.white60,
                  ),
                  const Icon(
                    Icons.circle,
                    size: 15,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  WelcomePage()));
                },
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xffbbebff), Colors.indigo],
                    ),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 300.0,
                      minHeight: 50.0,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'GET STARTED',
                      style: TextStyle(fontFamily: 'bold', fontSize: 16),
                    ),
                  ),
                ),
                style: blueButton(),
              ),
            ],
          ),
        )
      ],
    );
  }
}

blueButton() {
  return ElevatedButton.styleFrom(
    elevation: 0, backgroundColor: Colors.transparent,
    minimumSize: const Size.fromHeight(50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );
}

simpleInputText(text) {
  return InputDecoration(
    // border: InputBorder.none,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    hintText: text,
    hintStyle: TextStyle(color: Colors.grey.shade600),
    filled: true,
    fillColor: Colors.transparent,
  );
}

const styleColor = Color(0xFF6635CC);

styleheadText() {
  return const TextStyle(fontSize: 18.0, fontFamily: '', color: styleColor);
}

whiteHeadText() {
  return const TextStyle(
      fontSize: 18.0, fontFamily: 'lato', color: Colors.white);
}

simpleText() {
  return const TextStyle(fontFamily: 'lato', fontSize: 18);
}

simpleWhiteText() {
  return const TextStyle(fontFamily: 'lato', fontSize: 18, color: Colors.white);
}
