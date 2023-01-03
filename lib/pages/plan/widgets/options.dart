import 'package:flutter/material.dart';
import 'package:neatch/config/size_config.dart';
import 'package:neatch/config/palette.dart';

class CustomRadioCleaning extends StatefulWidget {
  @override
  createState() {
    return new CustomRadioCleaningState();
  }
}

class CustomRadioCleaningState extends State<CustomRadioCleaning> {
  List<RadioModelCleaning> sampleData = new List<RadioModelCleaning>();

  @override
  void initState() {
    super.initState();
    sampleData.add(new RadioModelCleaning(
      true,
      'assets/images/cleaning2.png',
      'Initial Cleaning',
    ));
    sampleData.add(new RadioModelCleaning(
      false,
      'assets/images/cleaning.png',
      'Upkeep Cleaning',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: sampleData.length,
        itemBuilder: (BuildContext context, int index) {
          return new Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10)),
              child: InkWell(
                onTap: () {
                  setState(() {
                    sampleData.forEach((element) => element.isSelected = false);
                    sampleData[index].isSelected = true;
                  });
                },
                child: new RadioItemCleaning(sampleData[index]),
              ));
        },
      ),
    ));
  }
}

class RadioItemCleaning extends StatelessWidget {
  final RadioModelCleaning _item;
  RadioItemCleaning(this._item);
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          Container(
            height: getProportionateScreenHeight(224),
            width: getProportionateScreenWidth(273),
            decoration: BoxDecoration(
              color: Palette.kCardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(_item.buttonImage),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Text(
            _item.text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(20.0),
                color: Palette.kDarkColor,
                fontWeight: FontWeight.w700,
                fontFamily: "Ubuntu"),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Container(
            height: getProportionateScreenWidth(38.0),
            width: getProportionateScreenWidth(38.0),
            child: Center(
              child: _item.isSelected
                  ? Icon(
                      Icons.done,
                      color: _item.isSelected
                          ? Palette.kLightColor
                          : Palette.kTertiaryColor,
                      size: getProportionateScreenWidth(24.0),
                      semanticLabel: 'Checked icon',
                    )
                  : Container(),
            ),
            decoration: new BoxDecoration(
              color: _item.isSelected
                  ? Palette.kTertiaryColor
                  : Colors.transparent,
              border: new Border.all(
                  width: 1.0,
                  color: _item.isSelected
                      ? Palette.kTertiaryColor
                      : Palette.lightGrey),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}

class RadioModelCleaning {
  bool isSelected;
  final String buttonImage;
  final String text;

  RadioModelCleaning(this.isSelected, this.buttonImage, this.text);
}
