import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/constants/constant.dart';
import 'package:provider_example/providers/counter_provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
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
