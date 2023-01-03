import 'package:flutter/material.dart';
import 'package:neatch/app.dart';
import 'package:provider/provider.dart';

import 'package:neatch/pages/sign/widgets/authentication.dart';
import 'package:neatch/config/palette.dart';
import 'package:neatch/config/size_config.dart';

class SignPage extends StatelessWidget {
  SignPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: getProportionateScreenWidth(40),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                constraints: BoxConstraints.expand(),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Palette.kPrimaryColor, width: 0),
                  color: Palette.kLightBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Consumer<ApplicationState>(
                        builder: (context, appState, _) => Authentication(
                          email: appState.email,
                          loginState: appState.loginState,
                          startLoginFlow: appState.startLoginFlow,
                          verifyEmail: appState.verifyEmail,
                          signInWithEmailAndPassword:
                              appState.signInWithEmailAndPassword,
                          cancelRegistration: appState.cancelRegistration,
                          registerAccount: appState.registerAccount,
                          signOut: appState.signOut,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
