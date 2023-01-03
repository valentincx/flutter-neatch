import 'package:flutter/material.dart';
import 'package:neatch/config/size_config.dart';
import 'package:neatch/config/palette.dart';

class CustomCheckboxExtras extends StatefulWidget {
  @override
  createState() {
    return new CustomCheckboxExtrasState();
  }
}

class CustomCheckboxExtrasState extends State<CustomCheckboxExtras> {
  List<CheckboxModel> sampleData = new List<CheckboxModel>();

  @override
  void initState() {
    super.initState();
    sampleData.add(new CheckboxModel(
        false, 'Inside Fridge', 'assets/images/extras_3.png', 4));
    sampleData.add(new CheckboxModel(
        false, 'Organizing', 'assets/images/extras_4.png', 0));
    sampleData.add(new CheckboxModel(
        false, 'Small Blinds', 'assets/images/extras_1.png', 10));
    sampleData.add(
        new CheckboxModel(false, 'Patio', 'assets/images/extras_2.png', 0));
    sampleData.add(new CheckboxModel(
        false, 'Organizing', 'assets/images/extras_3.png', 0));
    sampleData.add(new CheckboxModel(
        false, 'Small Blinds', 'assets/images/extras_4.png', 10));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GridView.builder(
        itemCount: sampleData.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemBuilder: (context, index) => InkWell(
          splashColor: Palette.kTertiaryColor,
          onTap: () {
            setState(() {
              sampleData[index].isSelected = !sampleData[index].isSelected;
            });
          },
          child: CheckboxItem(sampleData[index]),
        ),
      ),
    );
  }
}

class CheckboxItem extends StatelessWidget {
  final CheckboxModel _item;
  CheckboxItem(this._item);
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Stack(
        children: <Widget>[
          Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(30.0)),
                  width: getProportionateScreenWidth(121.0),
                  height: getProportionateScreenWidth(121.0),
                  decoration: BoxDecoration(
                    color: _item.isSelected
                        ? Palette.kPrimaryColor
                        : Palette.kCardColor,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    _item.buttonImage,
                    width: getProportionateScreenWidth(56.0),
                    height: getProportionateScreenWidth(56.0),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(12)),
                Text(
                  _item.buttonText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(18.0),
                      color: Palette.kDarkColor,
                      fontFamily: "Ubuntu"),
                )
              ],
            ),
          ),
          (_item.extrasQuantity == 0)
              ? Container()
              : new Positioned(
                  right: 10,
                  child: new Container(
                      width: getProportionateScreenHeight(40),
                      height: getProportionateScreenHeight(40),
                      decoration: new BoxDecoration(
                        color: Palette.kTertiaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: new Text(
                          _item.extrasQuantity.toString(),
                          style: new TextStyle(
                              fontSize: getProportionateScreenWidth(18.0),
                              color: Palette.kLightColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Ubuntu"),
                          textAlign: TextAlign.center,
                        ),
                      )),
                )
        ],
      ),
    );
  }
}

class CheckboxModel {
  bool isSelected;
  final String buttonText;
  final String buttonImage;
  final int extrasQuantity;

  CheckboxModel(
      this.isSelected, this.buttonText, this.buttonImage, this.extrasQuantity);
}
