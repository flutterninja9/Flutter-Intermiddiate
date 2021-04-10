import 'package:flutter/material.dart';
import 'package:flutter_based_bloc/features/counter/bloc/counter_bloc.dart';
import 'package:flutter_based_bloc/features/counter/counter-widget/counter-widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreenTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Test Counter Screen'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, state) {
            return CounterWidget(count: state.toString());
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(Decrement());
            },
            heroTag: 'dec',
            child: Icon(Icons.remove),
          ),
          SizedBox(
            width: 50,
          ),
          FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(Increment());
            },
            heroTag: 'inc',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
