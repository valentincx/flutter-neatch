import 'package:flutter/material.dart';
import 'package:neatch/config/size_config.dart';
import 'package:neatch/config/palette.dart';

class CustomRadioFrequency extends StatefulWidget {
  @override
  createState() {
    return new CustomRadioFrequencyState();
  }
}

class CustomRadioFrequencyState extends State<CustomRadioFrequency> {
  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {
    super.initState();
    sampleData.add(new RadioModel(true, 'Weekly'));
    sampleData.add(new RadioModel(false, 'Bi-weekly'));
    sampleData.add(new RadioModel(false, 'Monthly'));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        sampleData.length,
        (index) => InkWell(
          splashColor: Palette.kTertiaryColor,
          onTap: () {
            setState(() {
              sampleData.forEach((element) => element.isSelected = false);
              sampleData[index].isSelected = true;
            });
          },
          child: new RadioItem(sampleData[index]),
        ),
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(30.0)),
            width: getProportionateScreenWidth(175.0),
            child: new Center(
              child: new Text(_item.buttonText,
                  style: new TextStyle(
                      color: _item.isSelected
                          ? Palette.kLightColor
                          : Palette.kDarkColor,
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(20.0))),
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
              borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
            ),
          ),
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel(this.isSelected, this.buttonText);
}
