import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodel/view_model.dart';
import 'view/background_view.dart';
import 'view/slider_widget.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess The Number',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundView(),
          const SliderWidget(),
        ],
      ),
    );
  }
}
