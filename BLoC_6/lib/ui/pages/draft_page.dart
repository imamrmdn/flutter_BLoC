import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DraftPage extends StatelessWidget {
  final Color backgroundColor;
  final Widget bodyWidget;
  final Widget title;
  final Widget floatingButton;

  DraftPage({
    this.title,
    this.bodyWidget,
    this.backgroundColor = Colors.redAccent,
    this.floatingButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingButton,
      appBar: AppBar(
        title: title,
        backgroundColor: backgroundColor,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: bodyWidget,
      ),
    );
  }
}
