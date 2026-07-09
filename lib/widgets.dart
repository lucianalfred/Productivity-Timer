import 'package:flutter/material.dart';

class ProdutivityButton extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final VoidCallback onPressed;

  const ProdutivityButton({
    Key? key,
    required this.color,
    required this.text,
    required this.size,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: this.onPressed,
      color: this.color,
      minWidth: size,
      child: Text(this.text, style: TextStyle(color: Colors.white)),
    );
  }
}
