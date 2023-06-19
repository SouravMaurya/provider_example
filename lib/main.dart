import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/constants/constant.dart';
import 'package:provider_example/providers/counter_provider.dart';
import 'package:provider_example/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appTitleName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: Constants.homePageTitle),
      ),
    );
  }
}
