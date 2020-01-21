import 'package:flutter/material.dart';
import 'package:mpk_reporter/ui/views/HomeView.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/addIncident':
      // return MaterialPageRoute(builder: (_) => AddIncident());
      case '/incidentDetails':
      // return MaterialPageRoute(builder: (_) => IncidentDetails());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
