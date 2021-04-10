import 'package:flutter/material.dart';
import 'package:streams_in_dart/cubit/counter-cubit.dart';

class Counterscreen extends StatelessWidget {
  final counter = CounterCubit(10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increment();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: StreamBuilder(
          stream: counter.stream,
          builder: (context, index) {
            return Text(
              counter.state.toString(),
              style: Theme.of(context).textTheme.headline1,
            );
          },
        ),
      ),
    );
  }
}
