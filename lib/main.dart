import "package:flutter/material.dart";
import "package:percent_indicator/circular_percent_indicator.dart";
import "package:productivity_timer/widgets.dart";

import './timer.dart';
import './timermodel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Work Timer",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: TimerHomePage(),
    );
  }

  void emptyMethod() {}
}

class TimerHomePage extends StatelessWidget {
  final double defaultPadding = 5.0;

  final CountDownTimer timer = CountDownTimer();

  @override
  Widget build(BuildContext context) {
    timer.startWork();

    return Scaffold(
      appBar: AppBar(title: Text("My Work Timer")),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double availableWidth = constraints.maxWidth;

          return Column(
            children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                    child: ProdutivityButton(
                      color: Color(0xFFFF4081),
                      text: "Work",
                      onPressed: emptyMethod,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                    child: ProdutivityButton(
                      color: Color(0xff607D8B),
                      text: "Short Break",
                      onPressed: emptyMethod,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                    child: ProdutivityButton(
                      color: Color(0xff455A64),
                      text: "Long Break",
                      onPressed: emptyMethod,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                ],
              ),
              Expanded(
                child: StreamBuilder(
                  initialData: "00:00",
                  stream: timer.stream(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    TimerModel timer = (snapshot.data == '00:00')
                        ? TimerModel('00:00', 1)
                        : snapshot.data;
                    return Expanded(
                      child: CircularPercentIndicator(
                        radius: availableWidth / 4,
                        lineWidth: 10.0,
                        center: Text(
                          timer.time ?? "00:00",
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        progressColor: Color(0xFFFF4081),
                      ),
                    );
                  },
                ),
              ),

              Row(
                children: [
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                    child: ProdutivityButton(
                      color: Color(0xff212121),
                      text: "Stop",
                      onPressed: emptyMethod,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                    child: ProdutivityButton(
                      color: Color(0xFFFF4081),
                      text: "Restart",
                      onPressed: emptyMethod,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  void emptyMethod() {}
}
