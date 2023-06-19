import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/constants/constant.dart';
import 'package:provider_example/providers/counter_provider.dart';
import 'package:provider_example/providers/theme_provider.dart';
import 'package:provider_example/screens/second_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              Constants.youHavePushed,
            ),
            Consumer<CounterProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  value.counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            SizedBox(height: 100),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(),
                    ));
              },
              child: Text('Move to next page'),
              color: Colors.blue.withOpacity(0.3),
            ),
            SizedBox(height: 100),
            MaterialButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .changeTheme(ThemeData(
                  primarySwatch: Colors.red,
                ));
              },
              child: Text('Change theme'),
              color: Colors.blue.withOpacity(0.3),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            Provider.of<CounterProvider>(context, listen: false).addCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
