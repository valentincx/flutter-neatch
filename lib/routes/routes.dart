import 'package:flutter/material.dart';
import 'package:neatch/pages/calendar/calendar.dart';

import 'package:neatch/pages/load/load.dart';
import 'package:neatch/pages/profile/profile.dart';
import 'package:neatch/pages/sign/sign.dart';
import 'package:neatch/pages/success/success.dart';
import 'package:neatch/pages/upcoming/upcoming.dart';
import 'package:neatch/pages/home/home.dart';
import 'package:neatch/pages/plan/plan.dart';
import 'package:neatch/pages/splash/splash.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<dynamic>(builder: (_) => SplashPage());
      case 'load':
        return MaterialPageRoute<dynamic>(builder: (_) => LoadPage());
      case 'sign':
        return MaterialPageRoute<dynamic>(builder: (_) => SignPage());
      case 'home':
        return MaterialPageRoute<dynamic>(builder: (_) => HomePage());
      case 'plan':
        return MaterialPageRoute<dynamic>(builder: (_) => PlanPage());
      case 'upcoming':
        return MaterialPageRoute<dynamic>(builder: (_) => UpcomingPage());
      case 'profile':
        return MaterialPageRoute<dynamic>(builder: (_) => ProfilePage());
      case 'calendar':
        return MaterialPageRoute<dynamic>(builder: (_) => CalendarPage());
      case 'success':
        return MaterialPageRoute<dynamic>(builder: (_) => SuccessPage());

      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            );
          },
        );
    }
  }
}
