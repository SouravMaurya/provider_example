import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/constants/string_constant.dart';
import 'package:provider_example/providers/counter_provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    /// Creating object of CounterProvider with listenable value false
    CounterProvider counterProvider =
        Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.secondPage),
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Tooltip(
              message: StringConstants.back,
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 25,
              )),
        ),
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
