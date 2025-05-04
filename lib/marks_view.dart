import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_guess_the_number/view_model.dart';

class MarksView extends StatelessWidget {
  const MarksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Scores"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Consumer<ViewModel>(
        builder: (context, viewModel, child) {
          final topScores = viewModel.topScores;
          
          if (topScores.isEmpty) {
            return const Center(
              child: Text(
                "No scores yet!",
                style: TextStyle(fontSize: 20),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: topScores.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(
                    'Score: ${topScores[index]}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(Icons.star, color: Colors.amber),
                ),
              );
            },
          );
        },
      ),
    );
  }
}