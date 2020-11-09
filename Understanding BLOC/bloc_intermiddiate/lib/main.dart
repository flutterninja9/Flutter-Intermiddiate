import 'package:bloc_intermiddiate/bloc/counter_bloc.dart';
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
          title: 'Flutter Demo',
          home: CounterApp(),
          debugShowCheckedModeBanner: false,
        ));
  }
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App with Bloc"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterBlocState>(
          builder: (context, state) {
            if (state.countValue < 0) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    state.countValue.toString(),
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    "Going Negative! ",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              );
            } else if (state.countValue == 0) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    state.countValue.toString(),
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    "Neutral",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    state.countValue.toString(),
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    "Going Positive! ",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              );
            }
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'dec',
            child: Icon(Icons.remove),
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(CounterEvent.decrement);
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(CounterEvent.increment);
            },
            heroTag: 'inc',
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
