import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neatch/routes/routes.dart';

import 'package:neatch/pages/sign/widgets/authentication.dart';

import 'package:neatch/config/palette.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neatch',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonColor: Palette.kPrimaryColor,
        canvasColor: Palette.kPrimaryColor,
        accentColor: Palette.kSecondaryColor,
        primaryColor: Palette.kPrimaryColor,
        buttonTheme: const ButtonThemeData(
          buttonColor: Palette.kPrimaryColor,
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 34.0,
              fontWeight: FontWeight.w700,
              fontFamily: "Ubuntu"),
          headline3: TextStyle(
              fontSize: 29.0,
              fontWeight: FontWeight.w700,
              fontFamily: "Ubuntu"),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: Routers.generateRoute,
    );
  }
}

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  Future<void> init() async {
    await Firebase.initializeApp();

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loginState = ApplicationLoginState.loggedIn;
      } else {
        _loginState = ApplicationLoginState.loggedOut;
      }
      notifyListeners();
    });
  }

  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
  ApplicationLoginState get loginState => _loginState;

  String _email;
  String get email => _email;

  void startLoginFlow() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  void verifyEmail(
    String email,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      var methods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.contains('password')) {
        _loginState = ApplicationLoginState.password;
      } else {
        _loginState = ApplicationLoginState.register;
      }
      _email = email;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signInWithEmailAndPassword(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void cancelRegistration() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  void registerAccount(
    String email,
    String displayName,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user.updateProfile(displayName: displayName);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
