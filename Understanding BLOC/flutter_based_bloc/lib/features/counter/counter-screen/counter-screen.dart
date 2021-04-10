import 'package:flutter/material.dart';
import 'package:flutter_based_bloc/features/counter/bloc/counter_bloc.dart';
import 'package:flutter_based_bloc/features/counter/counter-screen/test-counter-screen-2.dart';
import 'package:flutter_based_bloc/features/counter/counter-widget/counter-widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        actions: [
          IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CounterScreenTest(),
                ));
              }),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, state) {
            return CounterWidget(count: state.toString());
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
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
