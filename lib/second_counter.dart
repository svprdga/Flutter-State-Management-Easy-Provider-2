import 'package:flutter/material.dart';
import 'package:flutter_state_management_easy_provider_2/main_model.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class SecondCounter extends StatefulWidget {
  const SecondCounter({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SecondCounter> createState() => _SecondCounterState();
}

class _SecondCounterState extends State<SecondCounter> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${model.counter}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            model.counter++;
            Provider.of<Logger>(context, listen: false).d(
              'Increment counter from SecondCounter',
            );
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
