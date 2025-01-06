import 'package:flutter/material.dart';

class PopScope extends StatelessWidget {
  final Future<bool> Function() canPop;
  final Widget child;

  const PopScope({
    Key? key,
    required this.canPop,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: canPop,
      child: child,
    );
  }
}
