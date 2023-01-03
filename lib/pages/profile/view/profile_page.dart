import 'package:flutter/material.dart';

import 'package:neatch/config/palette.dart';
import 'package:neatch/config/size_config.dart';

const _horizontalPadding = 40.0;

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: getProportionateScreenHeight(40)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(_horizontalPadding)),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, color: Palette.kLightColor),
                    ),
                  )),
                  const Spacer(),
                  Text(
                    "Profile",
                    style: TextStyle(
                      color: Palette.kLightColor,
                      fontSize: getProportionateScreenWidth(34.0),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Ubuntu",
                      height: 1.4,
                    ),
                  ),
                  const Spacer(flex: 2)
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(40)),
            Center(
              child: Image.asset(
                "assets/images/profilegroup.png",
                height: getProportionateScreenWidth(150),
                width: getProportionateScreenWidth(150),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(40)),
            _ProfileContent(),
          ],
          //),
        ),
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        constraints: BoxConstraints.expand(),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFFAFAFA),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: getProportionateScreenHeight(80)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        getProportionateScreenWidth(_horizontalPadding)),
                child: Text(
                  "Account",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(29.0),
                      color: Palette.kDarkColor,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Ubuntu"),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              ListTile(
                icon: 'assets/images/alarm.png',
                text: 'Notifications',
              ),
              ListTile(
                icon: 'assets/images/calendar.png',
                text: 'My Bookings',
              ),
              ListTile(
                icon: 'assets/images/tick.png',
                text: 'My Plan',
              ),
              ListTile(
                icon: 'assets/images/address.png',
                text: 'Addresses',
              ),
              SizedBox(height: getProportionateScreenHeight(60)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        getProportionateScreenWidth(_horizontalPadding)),
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
              ListTile(
                icon: 'assets/images/fb.png',
                text: 'Facebook',
              ),
              ListTile(
                icon: 'assets/images/twitter.png',
                text: 'Twitter',
              ),
              ListTile(
                icon: 'assets/images/mail.png',
                text: 'Gmail',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListTile extends StatelessWidget {
  const ListTile({
    Key key,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  final String icon, text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 3.0,
            color: Color(0xFFFAFAFA),
          ),
        ),
        color: Palette.kLightColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(_horizontalPadding),
            vertical: getProportionateScreenHeight(30)),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
            ),
            SizedBox(width: getProportionateScreenWidth(60)),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24.0),
                color: Palette.kDarkColor,
                fontFamily: "Ubuntu",
              ),
            )
          ],
        ),
      ),
    );
  }
}
