import 'package:flutter/material.dart';
import 'package:neatch/config/size_config.dart';
import 'package:neatch/config/palette.dart';

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> options = [
      {"icon": "assets/images/cleaning2.png", "text": "Adresses"},
      {"icon": "assets/images/cleaning2.png", "text": "Prestations"},
      {"icon": "assets/images/cleaning2.png", "text": "Cleaners"},
      {"icon": "assets/images/cleaning2.png", "text": "Extras"},
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        options.length,
        (index) => OptionCard(
          icon: options[index]["icon"],
          text: options[index]["text"],
          press: () {},
        ),
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 65,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                color: Palette.kCardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(icon),
            ),
            SizedBox(height: getProportionateScreenHeight(12)),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(18.0),
                  color: Palette.kDarkColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Ubuntu"),
            )
          ],
        ),
      ),
    );
  }
}
