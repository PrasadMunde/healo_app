import 'package:flutter/material.dart';
class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  String _heightUnit = 'feet';
  String _weightUnit = 'kilo';
  double _height = 5.5; // Default height in feet
  double _weight = 70; // Default weight in kilograms
  double _bmi = 0;
  String _category = '';

  void _calculateBMI() {
    double heightInMeters;
    if (_heightUnit == 'feet') {
      heightInMeters = _height * 0.3048; // Convert feet to meters
    } else {
      heightInMeters = _height / 100; // Convert cm to meters
    }

    double weightInKg;
    if (_weightUnit == 'pounds') {
      weightInKg = _weight * 0.453592; // Convert pounds to kilograms
    } else {
      weightInKg = _weight;
    }

    setState(() {
      _bmi = weightInKg / (heightInMeters * heightInMeters);
      _category = _getBMICategory(_bmi);
    });
  }

  String _getBMICategory(double bmi) {
    if (bmi < 16) {
      return 'You are: Severely Underweight';
    } else if (bmi < 16.9) {
      return 'You are: Underweight';
    } else if (bmi < 18.4) {
      return 'You are: Moderately Underweight';
    } else if (bmi < 24.9) {
      return 'You are: Normal weight';
    } else if (bmi < 29.9) {
      return 'You are: Overweight';
    } else if (bmi < 34.9) {
      return 'You are: Moderately Obese';
    } else if (bmi < 39.9) {
      return 'You are: Severely Obese';
    } else {
      return 'You are: Very Severely Obese';
    }
  }

  Color _getCategoryColor(String category) {
    if (category.contains('Underweight')) {
      return category.contains('Severely') ? Colors.red : Colors.orange;
    } else if (category.contains('Obese')) {
      return category.contains('Very Severely') ? Colors.red : Colors.orange;
    } else {
      return Colors.black;
    }
  }

  Widget buildNeumorphicContainer({required Widget child}) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[500]!,
            offset: Offset(4, 4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildNeumorphicContainer(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Height',
                      style: TextStyle(fontSize: 24),
                    ),
                    Row(
                      children: [
                        DropdownButton<String>(
                          value: _heightUnit,
                          onChanged: (String? newValue) {
                            setState(() {
                              _heightUnit = newValue!;
                            });
                          },
                          items: <String>['feet', 'cm']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Expanded(
                          child: Slider(
                            min: _heightUnit == 'feet' ? 1.0 : 30.0,
                            max: _heightUnit == 'feet' ? 8.0 : 250.0,
                            value: _height,
                            onChanged: (double value) {
                              setState(() {
                                _height = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            buildNeumorphicContainer(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Weight',
                      style: TextStyle(fontSize: 24),
                    ),
                    Row(
                      children: [
                        DropdownButton<String>(
                          value: _weightUnit,
                          onChanged: (String? newValue) {
                            setState(() {
                              _weightUnit = newValue!;
                            });
                          },
                          items: <String>['kilo', 'pounds']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Expanded(
                          child: Slider(
                            min: _weightUnit == 'kilo' ? 30.0 : 66.0,
                            max: _weightUnit == 'kilo' ? 150.0 : 330.0,
                            value: _weight,
                            onChanged: (double value) {
                              setState(() {
                                _weight = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _calculateBMI,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF1E1E1E), // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 20.0), // Button padding
                elevation: 10.0, // Shadow elevation
                shadowColor: Colors.black.withOpacity(0.5), // Shadow color
              ),
              child: Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 18.0, // Font size
                ),
              ),
            ),
            SizedBox(height: 20),
            buildNeumorphicContainer(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        _bmi == 0
                            ? 'Your BMI will be displayed here'
                            : 'Your BMI is ${_bmi.toStringAsFixed(2)}\n${_category}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          color: _bmi == 0
                              ? Colors.black
                              : _getCategoryColor(_category),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}