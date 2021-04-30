import 'package:flutter/material.dart';
import 'package:weather/sizedconfig.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizedConfig.blockSizeVertical;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "weatherry",
          style: TextStyle(
            fontSize: defaultSize * 5.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(defaultSize * 2, defaultSize * 4,
              defaultSize * 2, defaultSize * 2),
          child: TextField(
            textAlign: TextAlign.start,
            autofillHints: ["Search City"],
            decoration: InputDecoration(
              fillColor: Colors.white,
              hoverColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
