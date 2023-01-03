import 'package:flutter/material.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neatch/pages/home/widgets/scheduled_calendar.dart';
import 'package:neatch/config/size_config.dart';
import 'package:neatch/config/palette.dart';
import '../widgets/widgets.dart';

const _horizontalPadding = 40.0;

class HomePage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, 'sign');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<int> numbers = [1, 2, 3, 4, 5, 6];

    Widget TapableText(String text, String onTapRoute) {
      return GestureDetector(
        onTap: () async {
          Navigator.pushNamed(context, onTapRoute);
        },
        child: Text(
          text,
          style: TextStyle(
            color: Palette.kLightColor,
            fontSize: getProportionateScreenWidth(27.0),
            fontFamily: "Ubuntu",
            height: 1.4,
          ),
        ),
      );
    }

    Widget TapableLogout(String text) {
      return GestureDetector(
        onTap: () {
          _signOut(context);
        },
        child: Text(
          text,
          style: TextStyle(
            color: Palette.kLightColor,
            fontSize: getProportionateScreenWidth(27.0),
            fontFamily: "Ubuntu",
            height: 1.4,
          ),
        ),
      );
    }

    final GlobalKey<ScaffoldState> _homeScaffoldKey = GlobalKey();
    final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
        GlobalKey<ScaffoldMessengerState>();

    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: AnimatedDrawer(
        homePageXValue: 150,
        homePageYValue: 80,
        homePageAngle: -0.2,
        homePageSpeed: 250,
        shadowXValue: 122,
        shadowYValue: 110,
        shadowAngle: -0.275,
        shadowSpeed: 550,
        openIcon: SvgPicture.asset(
          "assets/images/menu.svg",
          color: Palette.kPrimaryColor,
        ),
        closeIcon: Icon(Icons.arrow_back_ios, color: Palette.kPrimaryColor),
        shadowColor: Color(0xFF4c41a3),
        backgroundGradient: LinearGradient(
          colors: [Color(0xff5C4DB1), Color(0xFF1f186f)],
        ),
        menuPageContent: Padding(
          padding: EdgeInsets.only(
              top: 100.0,
              left: getProportionateScreenWidth(_horizontalPadding)),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/profilegroup.png",
                  height: getProportionateScreenWidth(150),
                  width: getProportionateScreenWidth(150),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  "Kate Riggle",
                  style: TextStyle(
                    color: Palette.kLightColor,
                    fontSize: getProportionateScreenWidth(34.0),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Ubuntu",
                    height: 1.4,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(100)),
                TapableText('Home', 'home'),
                SizedBox(height: getProportionateScreenHeight(80)),
                TapableText('Addresses', 'home'),
                SizedBox(height: getProportionateScreenHeight(80)),
                TapableText('Book', 'plan'),
                SizedBox(height: getProportionateScreenHeight(80)),
                TapableText('Profile', 'profile'),
                SizedBox(height: getProportionateScreenHeight(80)),
                TapableText('Upcoming', 'upcoming'),
                SizedBox(height: getProportionateScreenHeight(80)),
                TapableLogout('Logout'),
                SizedBox(height: getProportionateScreenHeight(80)),
              ],
            ),
          ),
        ),
        homePageContent: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Tap back again to leave'),
          ),
          child: Scaffold(
            key: _homeScaffoldKey,
            body: Stack(
              children: <Widget>[
                SafeArea(
                  child: SingleChildScrollView(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: getProportionateScreenHeight(100)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(
                                _horizontalPadding * 2)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                "Hi Kate, \nWelcome Back",
                                style: TextStyle(
                                  color: Palette.kLightColor,
                                  fontSize: getProportionateScreenWidth(34.0),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Ubuntu",
                                  height: 1.4,
                                ),
                              ),
                              Image.asset(
                                "assets/images/profilegroup.png",
                                height: getProportionateScreenWidth(150),
                                width: getProportionateScreenWidth(150),
                              ),
                            ]),
                      ),
                      SizedBox(height: getProportionateScreenHeight(40)),
                      _HomeContent(numbers: numbers),
                    ],
                  )),
                ),
                Container(
                  width: getProportionateScreenWidth(120),
                  height: MediaQuery.of(context).padding.top +
                      AppBar().preferredSize.height +
                      getProportionateScreenHeight(10),
                  decoration: BoxDecoration(
                    color: Palette.kLightBackground,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent({
    Key key,
    @required this.numbers,
  }) : super(key: key);

  final List<int> numbers;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Palette.kLightBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: getProportionateScreenHeight(80)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(_horizontalPadding)),
              child: Text(
                "Options",
                //style: Theme.of(context).textTheme.headline3,
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(29.0),
                    color: Palette.kDarkColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Ubuntu"),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(_horizontalPadding)),
              child: Options(),
            ),
            SizedBox(height: getProportionateScreenHeight(40)),
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        getProportionateScreenWidth(_horizontalPadding)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "Scheduled cleaning",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(29.0),
                          color: Palette.kDarkColor,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Ubuntu"),
                    ),
                    Text(
                      //"See all (" + numbers.length.toString() + ")",
                      "See all",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(24.0),
                          color: Palette.kDarkColor,
                          fontFamily: "Montserrat"),
                    ),
                  ],
                )),
            SizedBox(height: getProportionateScreenHeight(40)),
            CalendarWidget(),
            SizedBox(height: getProportionateScreenHeight(40)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(_horizontalPadding)),
              child: Text(
                "Share",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(29.0),
                    color: Palette.kDarkColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Ubuntu"),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(_horizontalPadding)),
              child: GestureDetector(
                child: Container(
                    height: getProportionateScreenHeight(230),
                    decoration: BoxDecoration(
                        color: Palette.kPrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Row(children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          "assets/images/cleaning.png",
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: getProportionateScreenWidth(40)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Refer a friend,\nEarn 5 € discounts",
                                    style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(27.0),
                                      color: Palette.kLightColor,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Ubuntu",
                                      height: 1.6,
                                    ),
                                  ),
                                  SizedBox(
                                      height: getProportionateScreenHeight(40)),
                                  Text(
                                    "* Available until dec. 5",
                                    style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(13.0),
                                      color: Palette.kLightColor,
                                      fontFamily: "Ubuntu",
                                    ),
                                  ),
                                ]),
                          )),
                    ])),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(80)),
          ]),
    );
  }
}
