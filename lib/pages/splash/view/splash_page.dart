import 'package:flutter/material.dart';

import 'package:neatch/config/size_config.dart';
import 'package:neatch/config/palette.dart';
import '../widgets/splash_content.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  PageController _pageController;
  Animatable<Color> background;

  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "title": "Clean Home\nClean Life.",
      "text": "Book Cleaners at the Comfort of you home.",
      "image": "assets/images/splashbg1.png"
    },
    {
      "title": "Cleaning on demand",
      "text":
          "Book an appointment in less than 60 seconds and get on the schedule as early as tomorrow.",
      "image": "assets/images/splash1.png"
    },
    {
      "title": "Cleaning planning",
      "text":
          "Once you are satisfied with a cleaner, book him again at the desired frequency",
      "image": "assets/images/splash4.png"
    },
  ];

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  void _initialize() {
    background = TweenSequence<Color>([
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Palette.kPrimaryColor,
          end: Palette.kLightColor,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Palette.kLightColor,
          end: Palette.kLightColor,
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Palette.kLightColor,
          end: Palette.kLightColor,
        ),
      ),
    ]);
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          final color =
              _pageController.hasClients ? _pageController.page / 3 : .0;

          return DecoratedBox(
            decoration: BoxDecoration(
              color: background.evaluate(AlwaysStoppedAnimation(color)),
            ),
            child: child,
          );
        },
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                controller: _pageController,
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                  title: splashData[index]['title'],
                  currentPage: currentPage,
                ),
              ),
              if (currentPage != splashData.length - 1 && currentPage != 0)
                Positioned(
                  bottom: getProportionateScreenHeight(60),
                  right: getProportionateScreenWidth(40),
                  child: nextButton(),
                ),
              if (currentPage == splashData.length - 1)
                Positioned(
                  bottom: getProportionateScreenWidth(60),
                  right: getProportionateScreenWidth(40),
                  child: continueButton(),
                ),
              if (currentPage != 0)
                Positioned(
                  bottom: getProportionateScreenHeight(60),
                  left: getProportionateScreenWidth(40),
                  child: previousButton(),
                ),
              if (currentPage == 0)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: startButton(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget startButton() {
    return GestureDetector(
      onTap: nextPage,
      child: Container(
        width: getProportionateScreenWidth(310),
        height: getProportionateScreenWidth(120),
        decoration: BoxDecoration(
          color: Palette.kLightColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
          ),
        ),
        child: Center(
          child: Text(
            'Get started',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(26.0),
                color: Palette.kPrimaryColor,
                fontWeight: FontWeight.w700,
                fontFamily: "Ubuntu"),
          ),
        ),
      ),
    );
  }

  Widget nextButton() {
    return GestureDetector(
      onTap: nextPage,
      child: Row(children: [
        Text(
          'Next',
          style: TextStyle(
              fontSize: getProportionateScreenWidth(26.0),
              color: Palette.kLightColor,
              fontWeight: FontWeight.w700,
              fontFamily: "Ubuntu"),
        ),
        SizedBox(width: getProportionateScreenWidth(20)),
        Container(
            width: getProportionateScreenHeight(55),
            height: getProportionateScreenHeight(55),
            decoration: new BoxDecoration(
              color: Palette.kSecondaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.navigate_next,
                color: Palette.kLightColor,
              ),
            ))
      ]),
    );
  }

  Widget previousButton() {
    return GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, 'sign');
        },
        child: Container(
            height: getProportionateScreenHeight(55),
            child: Center(
              child: Text(
                'Skip',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(26.0),
                    color: Palette.kLightColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Ubuntu"),
              ),
            )));
  }

  Widget continueButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, 'sign');
      },
      child: Row(children: [
        Text(
          'Next',
          style: TextStyle(
              fontSize: getProportionateScreenWidth(26.0),
              color: Palette.kLightColor,
              fontWeight: FontWeight.w700,
              fontFamily: "Ubuntu"),
        ),
        SizedBox(width: getProportionateScreenWidth(20)),
        Container(
            width: getProportionateScreenHeight(55),
            height: getProportionateScreenHeight(55),
            decoration: new BoxDecoration(
              color: Palette.kSecondaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.navigate_next,
                color: Palette.kLightColor,
              ),
            ))
      ]),
    );
  }

  void nextPage() {
    _pageController.animateToPage(_pageController.page.toInt() + 1,
        duration: Duration(milliseconds: 500), curve: Curves.linearToEaseOut);
  }

  void previousPage() {
    _pageController.animateToPage(_pageController.page.toInt() - 1,
        duration: Duration(milliseconds: 300), curve: Curves.linearToEaseOut);
  }
}
