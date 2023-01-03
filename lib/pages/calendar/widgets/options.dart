import 'package:flutter/material.dart';
import 'package:neatch/config/size_config.dart';
import 'package:neatch/config/palette.dart';

const _horizontalPadding = 40.0;

class AppointmentRadio extends StatefulWidget {
  @override
  createState() {
    return new AppointmentRadioState();
  }
}

class AppointmentRadioState extends State<AppointmentRadio> {
  List<AppointmentRadioModel> appointmenteData =
      new List<AppointmentRadioModel>();

  @override
  void initState() {
    super.initState();
    appointmenteData.add(new AppointmentRadioModel(
      false,
      "8 AM",
      "Alexandra Johnson",
      "8AM - 9AM",
      "assets/images/profile.png",
      "Upkeep Cleaning",
      "3",
      "\$50",
    ));
    appointmenteData.add(new AppointmentRadioModel(
      false,
      "10 AM",
      "Alexandra Johnson",
      "10AM - 11AM",
      "assets/images/profile.png",
      "Upkeep Cleaning",
      "3",
      "\$50",
    ));
    appointmenteData.add(new AppointmentRadioModel(
      false,
      "1 PM",
      "Michael Hamilton",
      "1PM - 2PM",
      "assets/images/profile2.png",
      "Upkeep Cleaning",
      "3",
      "\$50",
    ));
    appointmenteData.add(new AppointmentRadioModel(
      false,
      "4 PM",
      "Michael Hamilton",
      "4PM - 5PM",
      "assets/images/profile2.png",
      "Upkeep Cleaning",
      "3",
      "\$50",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: appointmenteData.length,
      itemExtent: getProportionateScreenWidth(265),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(_horizontalPadding)),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            if (appointmenteData[index].isSelected) {
              Navigator.pushNamed(context, 'success');
            }
            setState(() {
              appointmenteData.forEach((element) => element.isSelected = false);
              appointmenteData[index].isSelected = true;
            });
          },
          child: new AppointmentItem(appointmenteData[index]),
        );
      },
    );
  }
}

class AppointmentItem extends StatelessWidget {
  final AppointmentRadioModel _item;

  AppointmentItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
          Padding(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(10.0)),
            child: Text(
              _item.hour,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(19.0),
                color: Palette.kDarkColor,
                fontWeight: FontWeight.w700,
                fontFamily: "Ubuntu",
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(460.0),
            height: getProportionateScreenWidth(250.0),
            child: Card(
              margin: EdgeInsets.only(
                  right: getProportionateScreenWidth(_horizontalPadding / 2),
                  bottom: getProportionateScreenWidth(20.0)),
              color:
                  _item.isSelected ? Palette.kPrimaryColor : Palette.kCardColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(30.0),
                    vertical: getProportionateScreenWidth(20.0)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height:
                                          getProportionateScreenHeight(20.0)),
                                  Text(
                                    _item.name,
                                    style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(19.0),
                                      color: _item.isSelected
                                          ? Palette.kLightColor
                                          : Palette.kPrimaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Ubuntu",
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                      height: getProportionateScreenHeight(25)),
                                  Text(
                                    _item.type,
                                    style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(17.0),
                                      color: _item.isSelected
                                          ? Palette.lightGrey
                                          : Palette.darkerGrey,
                                      fontFamily: "Ubuntu",
                                    ),
                                  ),
                                  SizedBox(
                                      height: getProportionateScreenHeight(10)),
                                  Text(
                                    _item.schedule,
                                    style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(14.0),
                                      color: _item.isSelected
                                          ? Palette.kLightColor
                                          : Palette.kPrimaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Ubuntu",
                                    ),
                                  ),
                                  SizedBox(
                                      height: getProportionateScreenHeight(20)),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: <Widget>[
                                        Text(
                                          "Client rating",
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(
                                                    17.0),
                                            color: _item.isSelected
                                                ? Palette.lightGrey
                                                : Palette.darkerGrey,
                                            fontFamily: "Ubuntu",
                                          ),
                                        ),
                                        Icon(
                                          Icons.star_rate,
                                          size:
                                              getProportionateScreenWidth(17.0),
                                          color: _item.isSelected
                                              ? Palette.kLightColor
                                              : Palette.kDarkColor,
                                        ),
                                        Icon(
                                          Icons.star_rate,
                                          size:
                                              getProportionateScreenWidth(17.0),
                                          color: _item.isSelected
                                              ? Palette.kLightColor
                                              : Palette.kDarkColor,
                                        ),
                                        _item.rating == "3"
                                            ? Icon(
                                                Icons.star_rate,
                                                size:
                                                    getProportionateScreenWidth(
                                                        17.0),
                                                color: _item.isSelected
                                                    ? Palette.kLightColor
                                                    : Palette.kDarkColor,
                                              )
                                            : Container(),
                                      ]),
                                ]),
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                //crossAxisAlignment: CrossAxisAlignment.baseline,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    _item.image,
                                    height: getProportionateScreenWidth(90),
                                    width: getProportionateScreenWidth(90),
                                  ),
                                  SizedBox(
                                      height: getProportionateScreenHeight(15)),
                                  _item.isSelected
                                      ? Text(
                                          "Confirm?",
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(
                                                    19.0),
                                            color: Palette.kLightColor,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "Ubuntu",
                                          ),
                                        )
                                      : Container(),
                                ])
                          ]),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Row(children: [
                              Icon(
                                Icons.call,
                                size: getProportionateScreenWidth(22.0),
                                color: _item.isSelected
                                    ? Palette.kLightColor
                                    : Palette.kPrimaryColor,
                              ),
                              SizedBox(width: getProportionateScreenWidth(20)),
                              Icon(
                                Icons.mail_outline,
                                size: getProportionateScreenWidth(22.0),
                                color: _item.isSelected
                                    ? Palette.kLightColor
                                    : Palette.kPrimaryColor,
                              ),
                            ]),
                            Text(
                              _item.price,
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(19.0),
                                color: _item.isSelected
                                    ? Palette.kLightColor
                                    : Palette.kPrimaryColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Ubuntu",
                              ),
                            ),
                          ]),
                    ]),
              ),
            ),
          )
        ]));
  }
}

class AppointmentRadioModel {
  bool isSelected;
  final String hour, name, schedule, image, type, rating, price;

  AppointmentRadioModel(
    this.isSelected,
    this.hour,
    this.name,
    this.schedule,
    this.image,
    this.type,
    this.rating,
    this.price,
  );
}
