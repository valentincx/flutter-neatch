import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neatch/config/size_config.dart';
import 'package:neatch/config/palette.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.title,
    this.text,
    this.image,
    this.currentPage,
  }) : super(key: key);
  final String text, title, image;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return currentPage == 0 ? primarySplash(context) : contentSplash(context);
  }

  Widget primarySplash(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Flexible(
          fit: FlexFit.loose,
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: getProportionateScreenWidth(40),
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Palette.kLightColor,
                    fontSize: getProportionateScreenWidth(55.0),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Ubuntu",
                    height: 1.4,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Palette.kLightColor,
                      fontSize: getProportionateScreenWidth(30.0),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Montserrat",
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 0.47 * MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage(image),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[]),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(120)),
      ],
    );
  }

  Widget contentSplash(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              top: getProportionateScreenHeight(40),
            ),
            child: Align(
              alignment: currentPage.isOdd
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Image.asset(image),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Palette.kPrimaryColor, width: 0),
              color: Palette.kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: getProportionateScreenHeight(100)),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Palette.kLightColor,
                          fontSize: getProportionateScreenWidth(39.0),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Ubuntu",
                          height: 1.4,
                        ),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(70)),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: TextStyle(
                          color: Palette.kLightColor,
                          fontSize: getProportionateScreenWidth(31.0),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat",
                          height: 1.4,
                        ),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(120)),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
