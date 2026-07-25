import 'package:flutter/material.dart';

typedef CallbackSetting = void Function(String, int);

class ProductivityButton extends StatelessWidget {
  final Color color;
  final String text;
  final double? size;
  final VoidCallback onPressed;

  const ProductivityButton({
    Key? key,
    required this.color,
    required this.text,
    required this.onPressed,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      minWidth: (size != null) ? size : 0,
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}

class SettingsButton extends StatelessWidget {
  final Color color;
  final String text;
  final int value;
  final String setting;
  final CallbackSetting callback;

  SettingsButton(
    this.color,
    this.text,
    this.value,
    this.setting,
    this.callback,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: this.color,
      onPressed: () => this.callback(this.setting, this.value),
      child: Text(this.text, style: TextStyle(color: Colors.white)),
    );
  }
}
