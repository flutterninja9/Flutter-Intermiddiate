import 'package:cubits_and_blocs_cli/TestCubit/testCubit.dart';
import 'package:flutter/material.dart';

class CubitView extends StatelessWidget {
  TestCubit cubit = TestCubit(0);
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
              cubit.decrement();
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: 'incCubit',
            child: Icon(Icons.add),
            onPressed: () {
              cubit.increment();
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: cubit.map((event) => event.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
                child: Text(snapshot.data,
                    style: Theme.of(context).textTheme.headline1));
          } else {
            return Center(
                child: Text(cubit.state.toString(),
                    style: Theme.of(context).textTheme.headline1));
          }
        },
      ),
    );
  }
}
