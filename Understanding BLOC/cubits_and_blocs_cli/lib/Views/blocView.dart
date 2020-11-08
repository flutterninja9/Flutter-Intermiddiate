import 'package:cubits_and_blocs_cli/TestBloc/testBloc.dart';
import 'package:cubits_and_blocs_cli/TestCubit/testCubit.dart';
import 'package:flutter/material.dart';

class BlocView extends StatelessWidget {
  TestBloc bloc = TestBloc(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Management With Cubits"),
        centerTitle: true,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'decCubit',
            child: Icon(Icons.remove),
            onPressed: () {
              bloc.add(CounterEvents.decrement);
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: 'incCubit',
            child: Icon(Icons.add),
            onPressed: () {
              bloc.add(CounterEvents.increment);
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: bloc.map((event) => event.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
                child: Text(snapshot.data,
                    style: Theme.of(context).textTheme.headline1));
          } else {
            return Center(
                child: Text(bloc.state.toString(),
                    style: Theme.of(context).textTheme.headline1));
          }
        },
      ),
    );
  }
}
