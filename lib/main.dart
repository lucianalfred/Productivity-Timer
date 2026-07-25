import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import './settings.dart';
import './timer.dart';
import './timermodel.dart';
import './widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Work Timer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: TimerHomePage(),
    );
  }
}

class TimerHomePage extends StatelessWidget {
  final double defaultPadding = 5.0;
  final CountDownTimer timer = CountDownTimer();
  final List<PopupMenuItem<String>> menuItems = [
    const PopupMenuItem<String>(value: 'Settings', child: Text('Settings')),
  ];
  @override
  Widget build(BuildContext context) {
    timer.startWork();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Work Timer'),
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return menuItems.toList();
            },
            onSelected: (s) {
              if (s == 'Settings') {
                goToSettings(context);
              }
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double availableWidth = constraints.maxWidth;

          return Column(
            children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                    child: ProductivityButton(
                      color: const Color(0xff536DFE),
                      text: "Work",
                      onPressed: () => timer.startWork(),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                    child: ProductivityButton(
                      color: const Color(0xff536DFE),
                      text: "Short Break",
                      onPressed: () => timer.startBreak(true),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                    child: ProductivityButton(
                      color: const Color(0xff536DFE),
                      text: "Long Break",
                      onPressed: () => timer.startBreak(false),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                ],
              ),
              Expanded(
                child: StreamBuilder<TimerModel>(
                  initialData: TimerModel('00:00', 1),
                  stream: timer.stream(),
                  builder:
                      (
                        BuildContext context,
                        AsyncSnapshot<TimerModel> snapshot,
                      ) {
                        if (!snapshot.hasData || snapshot.data == null) {
                          return CircularPercentIndicator(
                            radius: 100,
                            lineWidth: 10.0,
                            percent: 1,
                            center: const Text('00:00'),
                            progressColor: Color(0xff536DFE),
                          );
                        }

                        final TimerModel timerData = snapshot.data!;
                        return CircularPercentIndicator(
                          radius: availableWidth / 4,
                          lineWidth: 10.0,
                          percent: timerData.percent ?? 1,
                          center: Text(
                            timerData.time ?? '00:00',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),

                          progressColor: Color(0xff536DFE),
                        );
                      },
                ),
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                    child: ProductivityButton(
                      color: const Color(0xff212121),
                      text: 'Stop',
                      onPressed: () => timer.stopTimer(),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(defaultPadding)),
                  Expanded(
                    child: ProductivityButton(
                      color: const Color(0xff536DFE),
                      text: 'Restart',
                      onPressed: () => timer.startTimer(),
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

  void goToSettings(BuildContext context) {
    print('in gotoSettings');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsScreen()),
    );
  }
}
