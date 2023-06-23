import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/constants/string_constant.dart';
import 'package:provider_example/providers/counter_provider.dart';
import 'package:provider_example/providers/theme_provider.dart';
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
        /// It will create an instance of Provider class to it's descendants.
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: StringConstants.appTitleName,
            theme: value.appTheme,
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}
