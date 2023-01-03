import 'package:flutter/material.dart';

class LoadPage extends StatelessWidget {
  const LoadPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
