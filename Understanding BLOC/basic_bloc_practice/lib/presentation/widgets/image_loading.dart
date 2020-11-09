import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

Widget ImageLoadingInd() {
  return Container(
    child: LoadingIndicator(
      indicatorType: Indicator.ballScaleRippleMultiple,
      color: Colors.green,
    ),
  );
}
