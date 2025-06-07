import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:en_route_concierge/providers/walkthrough_provider.dart';
import 'package:en_route_concierge/router.dart';
import 'package:en_route_concierge/styles/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => WalkthroughProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        theme: ThemeScheme.light(),
        initialRoute: WalkthroughRoute,
      ),
    );
  }
}
