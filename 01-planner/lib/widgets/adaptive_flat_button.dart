import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String label;
  final Function eventHandler;

  AdaptiveFlatButton({
    @required this.label,
    @required this.eventHandler,
  });


  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            // color: Colors.amber[300],
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: eventHandler,
          )
        : TextButton(
            child: Text(label),
            style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            onPressed: eventHandler,
          );
  }
}
