import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/constants/string_constant.dart';
import 'package:provider_example/providers/counter_provider.dart';
import 'package:provider_example/screens/second_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    /// Creating object of CounterProvider with listenable value false
    CounterProvider counterProvider =
        Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.firstPage),
        actions: [
          InkWell(
            onTap: () {
              /// For navigating to next page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                  ));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Tooltip(
                  message: StringConstants.moveToNextPage,
                  child: Icon(
                    Icons.navigate_next,
                    size: 40,
                  )),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              StringConstants.youHavePushed,
            ),
            const SizedBox(height: 15),
            Consumer<CounterProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  value.counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterProvider.incrementCounter,
        tooltip: StringConstants.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
