import 'package:flutter/material.dart';

class ProdutivityButton extends StatelessWidget {
  final Color color;
  final String text;
  final double? size;
  final VoidCallback onPressed;

  const ProdutivityButton({
    Key? key,
    required this.color,
    required this.text,
    required this.onPressed,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: this.onPressed,
      color: this.color,
      minWidth: (this.size != null) ? this.size : 0,
      child: Text(this.text, style: TextStyle(color: Colors.white)),
    );
  }
}

class SettingsButton extends StatelessWidget {
  final Color color;
  final String text;
  final int value;

  const SettingsButton(this.color, this.text, this.value);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(this.text, style: TextStyle(color: Colors.white)),
      onPressed: () => null,
      color: this.color,
    );
  }
}
