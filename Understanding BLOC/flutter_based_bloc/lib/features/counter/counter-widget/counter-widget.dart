import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    Key key,
    @required this.count,
  }) : super(key: key);

  final String count;

  @override
  Widget build(BuildContext context) {
    return Text(
      count,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
