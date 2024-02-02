import 'package:flutter/material.dart';

class SafeAreaComponent extends StatelessWidget {
  const SafeAreaComponent({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: child,
      ),
    );
  }
}
