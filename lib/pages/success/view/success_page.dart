import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:neatch/config/palette.dart';
import 'package:neatch/config/size_config.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 0.4 * MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage("assets/images/splashbg1.png"),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20.0)),
                  height: getProportionateScreenWidth(220),
                  width: getProportionateScreenWidth(220),
                  decoration: BoxDecoration(
                      color: Palette.kLightColor, shape: BoxShape.circle),
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(50.0)),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.0,
                          color: Palette.kPrimaryColor,
                        ),
                        color: Palette.kLightColor,
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      "assets/images/check.svg",
                      color: Palette.kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "The booking\nhas been accepted",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Palette.kLightColor,
                    fontSize: getProportionateScreenWidth(40.0),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Ubuntu",
                    height: 1.4,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(40)),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    "You will receive an email confirmation summarizing the details.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Palette.kLightColor,
                      fontSize: getProportionateScreenWidth(24.0),
                      fontFamily: "Montserrat",
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: getProportionateScreenHeight(100),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Palette.kTertiaryColor,
                  shape: StadiumBorder(),
                ),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, 'home'),
                child: Text(
                  'Back to home',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Palette.kLightColor,
                    fontSize: getProportionateScreenWidth(28.0),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Montserrat",
                    height: 1.4,
                  ),
                ),
              ),
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
