import 'package:flutter/material.dart';

import 'package:neatch/config/palette.dart';
import 'package:neatch/config/size_config.dart';

enum ApplicationLoginState {
  loggedOut,
  emailAddress,
  register,
  password,
  loggedIn,
}

const _horizontalPadding = 40.0;

class Authentication extends StatelessWidget {
  const Authentication({
    @required this.loginState,
    @required this.email,
    @required this.startLoginFlow,
    @required this.verifyEmail,
    @required this.signInWithEmailAndPassword,
    @required this.cancelRegistration,
    @required this.registerAccount,
    @required this.signOut,
    @required this.generateExceptionMessage,
  });

  final ApplicationLoginState loginState;
  final String email;
  final void Function() startLoginFlow;
  final void Function(
    String email,
    void Function(Exception) error,
  ) verifyEmail;
  final void Function(
    String email,
    String password,
    void Function(Exception) error,
  ) signInWithEmailAndPassword;
  final void Function() cancelRegistration;
  final void Function(
    String email,
    String displayName,
    String password,
    void Function(Exception) error,
  ) registerAccount;
  final void Function() signOut;
  final String Function(
    String errorCode,
  ) generateExceptionMessage;

  @override
  Widget build(BuildContext context) {
    switch (loginState) {
      case ApplicationLoginState.loggedOut:
        return EmailForm(
            callback: (email) => verifyEmail(
                  email,
                  (e) => _showErrorSnackbar(context, 'Invalid email', e),
                ));
      case ApplicationLoginState.emailAddress:
        return EmailForm(
            callback: (email) => verifyEmail(
                  email,
                  (e) => _showErrorSnackbar(context, 'Invalid email', e),
                ));
      case ApplicationLoginState.password:
        return PasswordForm(
          email: email,
          login: (email, password) {
            signInWithEmailAndPassword(
              email,
              password,
              (e) => _showErrorSnackbar(context, 'Failed to sign in', e),
            );
          },
        );
      case ApplicationLoginState.register:
        return RegisterForm(
          email: email,
          cancel: () {
            cancelRegistration();
          },
          registerAccount: (
            email,
            displayName,
            password,
          ) {
            registerAccount(
              email,
              displayName,
              password,
              (e) => _showErrorSnackbar(context, 'Failed to create account', e),
            );
          },
        );
      case ApplicationLoginState.loggedIn:
        Future.delayed(Duration.zero, () {
          Navigator.pushReplacementNamed(context, 'home');
        });
        return Container();
        break;
      default:
        return Row(
          children: [
            Text("Internal error, this shouldn't happen..."),
          ],
        );
    }
  }

  void _showErrorSnackbar(BuildContext context, String title, Exception e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        title,
      ),
    ));
  }
}

class EmailForm extends StatefulWidget {
  EmailForm({@required this.callback});
  final void Function(String email) callback;
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_EmailFormState');
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenHeight(40)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(_horizontalPadding)),
              child: Text(
                "Sign In",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(34.0),
                    color: Palette.kPrimaryColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Ubuntu"),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(50)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(_horizontalPadding)),
              child: Text(
                "Sign in with your email and password to access to the full service.",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(27.0),
                    color: Palette.kDarkColor,
                    fontFamily: "Ubuntu"),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(50)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(_horizontalPadding)),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter your email address to continue';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: getProportionateScreenHeight(50)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState.validate()) {
                              widget.callback(_controller.text);
                            }
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
                                  color: Palette.kPrimaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.navigate_next,
                                    color: Palette.kLightColor,
                                  ),
                                ))
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(40)),
          ],
        ));
  }
}

class RegisterForm extends StatefulWidget {
  RegisterForm({
    @required this.registerAccount,
    @required this.cancel,
    @required this.email,
  });
  final String email;
  final void Function(String email, String displayName, String password)
      registerAccount;
  final void Function() cancel;
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_RegisterFormState');
  final _emailController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenHeight(40)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(_horizontalPadding)),
              child: Text(
                "Create Account",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(34.0),
                    color: Palette.kPrimaryColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Ubuntu"),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(50)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(_horizontalPadding)),
              child: Text(
                "Create an account in order to access to the full service.",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(27.0),
                    color: Palette.kDarkColor,
                    fontFamily: "Ubuntu"),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(50)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(_horizontalPadding)),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter your email address to continue';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: getProportionateScreenHeight(50)),
                    TextFormField(
                      controller: _displayNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'First & last name',
                        hintText: 'First & last name',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter your first & last name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: getProportionateScreenHeight(50)),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Password',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: getProportionateScreenHeight(50)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: widget.cancel,
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(29.0),
                                color: Palette.kDarkColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Ubuntu"),
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(40)),
                        GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState.validate()) {
                              widget.registerAccount(
                                _emailController.text,
                                _displayNameController.text,
                                _passwordController.text,
                              );
                            }
                          },
                          child: Row(children: [
                            Text(
                              'Save',
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
                                  color: Palette.kPrimaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.navigate_next,
                                    color: Palette.kLightColor,
                                  ),
                                ))
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(40)),
          ],
        ));
  }
}

class PasswordForm extends StatefulWidget {
  PasswordForm({
    @required this.login,
    @required this.email,
  });
  final String email;
  final void Function(String email, String password) login;
  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_PasswordFormState');
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenHeight(40)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(_horizontalPadding)),
              child: Text(
                "Sign In",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(34.0),
                    color: Palette.kPrimaryColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Ubuntu"),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(50)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(_horizontalPadding)),
              child: Text(
                "Sign in with your email and password to access to the full service.",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(27.0),
                    color: Palette.kDarkColor,
                    fontFamily: "Ubuntu"),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(50)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(_horizontalPadding)),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter your email address to continue';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: getProportionateScreenHeight(50)),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter your password',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: getProportionateScreenHeight(50)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState.validate()) {
                              widget.login(
                                _emailController.text,
                                _passwordController.text,
                              );
                            }
                          },
                          child: Row(children: [
                            Text(
                              'Sign in',
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
                                  color: Palette.kPrimaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.navigate_next,
                                    color: Palette.kLightColor,
                                  ),
                                ))
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(40)),
          ],
        ));
  }
}
