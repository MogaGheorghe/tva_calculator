import 'package:flutter/material.dart';
import 'package:tva_calculator/tva_button.dart';

class TvaWidget extends StatefulWidget {
  const TvaWidget({super.key});

  @override
  State<TvaWidget> createState() {
    return _DiceWidgetState();
  }
}

class _DiceWidgetState extends State<TvaWidget> {
  double calculatedTVA = 0;
  final TextEditingController _priceController = TextEditingController();

  void calculateTVA(double price, double tvaPercent) {
    if (price > 0){
      setState(() {
        calculatedTVA = price + price * tvaPercent / 100;
      });
    }

  }

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "TVA CALCULATOR:",
            style: TextStyle(fontSize: 35, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Enter the price without TVA:",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          SizedBox(
            width: 300,
            child: TextField(
              controller: _priceController,
              style: TextStyle(color: Colors.yellow),
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.yellow),
                hintText: 'Enter the value...',
                hintStyle: TextStyle(color: Colors.yellow.shade400),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.yellow, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.yellow, width: 2.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TvaButton(
                  percent: 5,
                  controller: _priceController,
                  onPressed: calculateTVA,
                ),
                TvaButton(
                  percent: 8,
                  controller: _priceController,
                  onPressed: calculateTVA,
                ),
                TvaButton(
                  percent: 20,
                  controller: _priceController,
                  onPressed: calculateTVA,
                ),
              ],
            ),
          ),
          Text(
            'Calculated TVA: ${calculatedTVA.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
