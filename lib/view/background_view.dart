import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'marks_view.dart';
import 'number_view.dart';
import 'rounded_view.dart';
import '../viewmodel/view_model.dart';

class BackgroundView extends StatelessWidget {
  const BackgroundView({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ViewModel>(); 
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              TextButton(onPressed:(){appState.restartGame();}, child: RoundedView(icon: Icons.refresh)),
              Spacer(),
              TextButton(onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MarksView()));
              }, child: RoundedView(icon: Icons.list)),
            ],
          ),
          Spacer(),
          Row(
            children: [
              NumberView(text: "SCORE", value: appState.score),
              Spacer(),
              NumberView(text: "ROUND", value: appState.rounds),
            ],
          ),
        ],
      ),
    );
  }
}