import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleProgressIndicatorWidget extends StatelessWidget {
  const CircleProgressIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoActivityIndicator(
      radius: 20,
      color: Colors.grey,
      animating: true,
    );
  }
}
