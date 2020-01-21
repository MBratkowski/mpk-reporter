import 'package:flutter/material.dart';
import 'package:mpk_reporter/core/viewmodels/CRUDModel.dart';
import 'package:mpk_reporter/locator.dart';
import 'package:mpk_reporter/ui/router.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MpkReporterApp());
}

class MpkReporterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CRUDModel>(create: (_) => locator<CRUDModel>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        title: 'Incident App',
        theme: ThemeData(),
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
