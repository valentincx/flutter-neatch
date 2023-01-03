import '../widgets/widgets.dart';

import 'package:flutter/material.dart';

import 'package:neatch/config/palette.dart';
import 'package:neatch/config/size_config.dart';

const _horizontalPadding = 40.0;

class PlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<int> numbers = [1, 2, 3, 4, 5, 6];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    "Your Plan",
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
            _PlanContent(numbers: numbers),
          ],
        )),
      ),
    );
  }
}

class _PlanContent extends StatelessWidget {
  const _PlanContent({
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
                    horizontal:
                        getProportionateScreenWidth(_horizontalPadding)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Selected Cleaning",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(29.0),
                            color: Palette.kDarkColor,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Ubuntu"),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'calendar');
                        },
                        child: Row(children: [
                          Text(
                            'Next',
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(29.0),
                                color: Palette.kDarkColor,
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
                      )
                    ])),
            SizedBox(height: getProportionateScreenHeight(30)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(_horizontalPadding)),
              child: CustomRadioCleaning(),
            ),
            SizedBox(height: getProportionateScreenHeight(40)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(_horizontalPadding)),
              child: Text(
                "Selected Frequency",
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
              child: CustomRadioFrequency(),
            ),
            SizedBox(height: getProportionateScreenHeight(40)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(_horizontalPadding)),
              child: Text(
                "Selected Extras",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(29.0),
                    color: Palette.kDarkColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Ubuntu"),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(40)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(_horizontalPadding)),
              child: CustomCheckboxExtras(),
            ),
            SizedBox(height: getProportionateScreenHeight(80)),
          ]),
    );
  }
}
