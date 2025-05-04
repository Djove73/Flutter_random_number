import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/view_model.dart';

class SliderWidget extends StatefulWidget {
  final double value;
  final Function(double) onChanged;
  final double min;
  final double max;

  const SliderWidget({
    super.key,
    required this.value,
    required this.onChanged,
    required this.min,
    required this.max,
  });

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _value = 50;
  final double _MIN_VALUE = 1.0;
  final double _MAX_VALUE = 100.0;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ViewModel>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("🎯🎯🎯🎯", style: Theme.of(context).textTheme.headlineMedium),
          Text(
            "${appState.targetValue}",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              letterSpacing: -1,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Slider(
              value: _value,
              onChanged: _onChanged,
              min: _MIN_VALUE,
              max: _MAX_VALUE,
            ),
          ),
          ElevatedButton(
            onPressed: _onPressed,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(48, 48),
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
            ),
            child: Text(
              "TRY",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onChanged(double value) {
    setState(() {
      _value = value;
    });
  }

  void _onPressed() {
    var appState = Provider.of<ViewModel>(context, listen: false);
    appState.calculatePoints(_value);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Congratulations"),
        content: Text("Your points are: ${appState.points}"),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                appState.reset();
              });
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}