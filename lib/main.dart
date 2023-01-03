import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:neatch/app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => App(),
    ),
  );
}
