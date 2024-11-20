import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator by Roshan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '';

  void _buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _output = '';
      } else if (value == '=') {
        try {
          _output = _calculateOutput(_output);
        } catch (e) {
          _output = 'Error';
        }
      } else {
        _output += value;
      }
    });
  }

  String _calculateOutput(String input) {
    try {
      input = input.replaceAll('x', '*').replaceAll('%', '/100');
      double result = double.parse(input);
      return result.toString();
    } catch (_) {
      return 'Aka kalla joyidami ???'; // Invalid input
    }
  }

Widget _buildButton(String text, {Color color = Colors.white, double flex = 1}) {
  return Expanded(
    flex: flex.toInt(),
    child: Container(
      margin: const EdgeInsets.all(4),
      child: SizedBox(
        height: 1000, // Tugmaning balandligi
        width: 10000000,  // Tugmaning eni (kontekstga qarab o'zgartiriladi)
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // To'rtburchak shakli
            ),
          ),
          onPressed: () => _buttonPressed(text),
          child: Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerRight,
              child: Text(
                _output,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('C', color: const Color.fromARGB(255, 248, 232, 85)),
                      _buildButton('(', color: Colors.blue.shade100),
                      _buildButton(')', color: Colors.blue.shade100),
                      _buildButton('/', color: const Color.fromARGB(255, 243, 144, 6)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('7', color: Colors.blue.shade100),
                      _buildButton('8', color: Colors.blue.shade100),
                      _buildButton('9', color: Colors.blue.shade100),
                      _buildButton('x', color: const Color.fromARGB(255, 243, 144, 6)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('4', color: Colors.blue.shade100),
                      _buildButton('5', color: Colors.blue.shade100),
                      _buildButton('6', color: Colors.blue.shade100),
                      _buildButton('-', color: const Color.fromARGB(255, 243, 144, 6)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('1', color: Colors.blue.shade100),
                      _buildButton('2', color: Colors.blue.shade100),
                      _buildButton('3', color: Colors.blue.shade100),
                      _buildButton('+', color: const Color.fromARGB(255, 243, 144, 6)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('0', color: Colors.blue.shade100, flex: 2),
                      _buildButton('.', color: Colors.blue.shade100),
                      _buildButton('=', color: const Color.fromARGB(255, 14, 143, 19)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
