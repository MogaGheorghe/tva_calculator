import 'package:flutter/material.dart';

class TvaButton extends StatelessWidget {
  const TvaButton({
    super.key,
    required this.percent,
    required this.controller,
    required this.onPressed,
  });

  final double percent;
  final TextEditingController controller;
  final void Function(double price, double percent) onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          final price = double.tryParse(controller.text) ?? 0;
          onPressed(price, percent);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.yellow,
          padding: const EdgeInsets.all(5),
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text('${percent.toStringAsFixed(0)}%'),
      ),
    );
  }
}
