import 'package:deep_dive_bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Counter App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: CounterPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc bloc = BlocProvider.of<CounterBloc>(context);
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        if (state is Loading) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Load Test'),
              centerTitle: true,
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('Load Test'),
              centerTitle: true,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                bloc.add(Load());
              },
              child: Icon(Icons.add),
            ),
            body: Center(
              child: Text(
                'Data Loaded!',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          );
        }
      },
    );
  }
}
