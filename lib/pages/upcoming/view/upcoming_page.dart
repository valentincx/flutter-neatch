import 'package:flutter/material.dart';

import 'package:neatch/config/palette.dart';
import 'package:neatch/config/size_config.dart';

const _horizontalPadding = 40.0;

class UpcomingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(children: [
              Container(
                height: 0.46 * MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/map3.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    bottom: 40.0,
                    right: getProportionateScreenWidth(_horizontalPadding)),
                height: 0.46 * MediaQuery.of(context).size.height,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Material(
                    elevation: 0,
                    clipBehavior: Clip.hardEdge,
                    type: MaterialType.circle,
                    color: Colors.grey[200],
                    child: Stack(
                      children: [
                        Ink(
                          decoration: const ShapeDecoration(
                            color: Palette.kTertiaryColor,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.gps_fixed,
                            ),
                            color: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: getProportionateScreenHeight(40)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            getProportionateScreenWidth(_horizontalPadding)),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back,
                                color: Palette.kLightColor),
                          ),
                        )),
                        const Spacer(),
                        Text(
                          "Upcoming",
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
                ],
              ),
            ]),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Palette.kPrimaryColor, width: 0),
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
                    SizedBox(height: getProportionateScreenHeight(60)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              getProportionateScreenWidth(_horizontalPadding)),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/profile.png",
                            height: getProportionateScreenWidth(130),
                            width: getProportionateScreenWidth(130),
                          ),
                          SizedBox(width: getProportionateScreenWidth(50)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Samantha",
                                      style: TextStyle(
                                        color: Palette.kDarkColor,
                                        fontSize:
                                            getProportionateScreenWidth(34.0),
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Ubuntu",
                                        height: 1.4,
                                      ),
                                    ),
                                    OutlinedButton.icon(
                                      label: Text(
                                        '(4.5)',
                                        style: TextStyle(
                                          color: Palette.kDarkColor,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Ubuntu",
                                          height: 1.4,
                                        ),
                                      ),
                                      icon: Icon(
                                        Icons.grade,
                                        color: Palette.kDarkColor,
                                      ),
                                      onPressed: () {
                                        print('Pressed');
                                      },
                                    )
                                  ],
                                ),
                                Text(
                                  "Your cleaner is arriving \nin 7 minutes.",
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(29.0),
                                      color: Palette.darkerGrey,
                                      fontFamily: "Ubuntu"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(80)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
