import 'package:flutter/material.dart';

import 'widgets.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Settings(),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextStyle textStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        childAspectRatio: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: <Widget>[
          Text("Work", style: textStyle),
          Text(""),
          Text(""),
          SettingsButton(Color(0xFFFF4081), "+", -1),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          SettingsButton(Color(0xFFFF4081), "-", -1),
          Text("Short", style: textStyle),
          Text(""),
          Text(""),
          SettingsButton(Color(0xFFFF4081), "-", -1),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          SettingsButton(Color(0xFFFF4081), "+", -1),
          Text("Long", style: textStyle),
          Text(""),
          Text(""),
          SettingsButton(Color(0xFFFF4081), "+", -1),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          SettingsButton(Color(0xFFFF4081), "-", -1),
        ],
        padding: const EdgeInsets.all(20.0),
      ),
    );
  }
}
