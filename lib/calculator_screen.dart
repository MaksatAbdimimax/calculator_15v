import 'package:flutter/material.dart';
import 'colors.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String result = '';
  String firstValue = '';
  String operation = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors().background,
        body: Column(
          children: [


            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerRight,
              child: Text(
                result.isEmpty ? '0' : result,
                style: const TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                ),
              ),
            ),

            Expanded(
              child: Column(
                children: [

                  buildRow(['C', '+/-', '%', '/']),
                  buildRow(['7', '8', '9', '*']),
                  buildRow(['4', '5', '6', '-']),
                  buildRow(['1', '2', '3', '+']),
                  buildRow(['0', '.', '='], isLastRow: true),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildRow(List<String> buttons, {bool isLastRow = false}) {
    return Expanded(
      child: Row(
        children: buttons.map((text) {

          int flex = (isLastRow && text == '0') ? 2 : 1;

          return buildCalcButton(
            text,
            flex: flex,
            gradientColors: _getColor(text),
            onTap: () => onButtonTap(text),
          );

        }).toList(),
      ),
    );
  }


  void onButtonTap(String text) {
    setState(() {
      if ('0123456789'.contains(text)) {
        if (result == '0') result = '';
        result += text;
      }

      else if (text == '.') {
        if (!result.contains('.')) result += '.';
      }

      else if (text == 'C') {
        result = '';
        firstValue = '';
        operation = '';
      }

      else if (text == '+/-') {
        if (result.startsWith('-')) {
          result = result.substring(1);
        } else {
          result = '-$result';
        }
      }

      else if (text == '%') {
        final value = double.tryParse(result) ?? 0;
        result = (value / 100).toString();
      }

      else if (text == '=') {
        calculate();
      }

      else {
        firstValue = result;
        result = '';
        operation = text;
      }
    });
  }


  void calculate() {
    final a = double.tryParse(firstValue) ?? 0;
    final b = double.tryParse(result) ?? 0;
    double res = 0;

    switch (operation) {
      case '+':
        res = a + b;
        break;
      case '-':
        res = a - b;
        break;
      case '*':
        res = a * b;
        break;
      case '/':
        res = b == 0 ? 0 : a / b;
        break;
    }

    result = res.toString();
    operation = '';
    firstValue = '';
  }


  List<Color>? _getColor(String text) {
    if ('/*-+=/'.contains(text) || text == '=') {
      return [Colors.orange, Colors.redAccent];
    }
    if (text == 'C') {
      return [AppColors().orange, Colors.deepOrange];
    }
    return null;
  }


  Widget buildCalcButton(
      String text, {
        List<Color>? gradientColors,
        Function()? onTap,
        int flex = 1,
      }) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors ??
                    [AppColors().firstGrad, AppColors().secondGrad],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              text,
              style: const TextStyle(fontSize: 26, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
