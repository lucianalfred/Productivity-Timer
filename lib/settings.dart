import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  SharedPreferences? prefs;

  late TextEditingController txtWork;
  late TextEditingController txtShort;
  late TextEditingController txtLong;

  static const String WORKTIME = "workTime";
  static const String SHORTBREAK = "shortBreak";
  static const String LONGBREAK = "longBreak";

  int shortBreak = 25;
  int workTime = 5;
  int longBreak = 15;

  @override
  void initState() {
    super.initState();
    TextEditingController txtWork = TextEditingController(
      text: workTime.toString(),
    );
    TextEditingController txtShort = TextEditingController(
      text: shortBreak.toString(),
    );
    TextEditingController txtLong = TextEditingController(
      text: longBreak.toString(),
    );
    readSettings();
  }

  @override
  void dispose() {
    txtWork.dispose();
    txtShort.dispose();
    txtLong.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller:
    txtWork;
    controller:
    txtShort;
    controller:
    txtLong;
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
          SettingsButton(Color(0xFFFF4081), "+", -1),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          SettingsButton(Color(0xFFFF4081), "-", -1),
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

  void readSettings() async {
    prefs = await SharedPreferences.getInstance();
    int workTime = prefs?.getInt(WORKTIME) ?? 25;
    int shortBreak = prefs?.getInt(SHORTBREAK) ?? 5;
    int longBreak = prefs?.getInt(LONGBREAK) ?? 15;
    setState(() {
      txtWork.text = workTime.toString();
      txtShort.text = shortBreak.toString();
      txtLong.text = longBreak.toString();
    });
  }

  void updateSetting(String key, int value) {
    switch (key) {
      case WORKTIME:
        {
          int workTime = prefs.getInt(key) ?? 30;
          workTime += value;
          if (workTime >= 1 && workTime <= 180) {
            prefs.setInt(WORKTIME, workTime);
            setState(() {
              txtWork.text = workTime.toString();
            });
          }
        }
      case SHORTBREAK:
        {}
      case LONGBREAK:
        {}
    }
  }
}
