import 'dart:ui';

import 'package:weather/sizedconfig.dart';
import 'package:flutter/material.dart';

class BlurBox extends StatefulWidget {
  BlurBox({this.child});
  final Widget child;

  @override
  _BlurBoxState createState() => _BlurBoxState();
}

class _BlurBoxState extends State<BlurBox> {
  @override
  Widget build(BuildContext context) {
    SizedConfig().init(context);
    double defaultSize = SizedConfig.blockSizeVertical;
    return ClipRRect(
      borderRadius: BorderRadius.circular(defaultSize * 4),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
