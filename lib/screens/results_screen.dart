import 'package:flutter/material.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

import './recipeList_screen.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = '/results-screen';
  const ResultScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final labels =
        ModalRoute.of(context)!.settings.arguments as List<ImageLabel>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
      ),
      body: ListView.builder(
        itemCount: labels.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => RecipeListScreen(),
                  settings: RouteSettings(arguments: labels[index].label),
                ),
              );
            },
            child: SizedBox(
              height: 50,
              child: Card(
                color: Colors.amber,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(6),
                    ),
                    Text(
                      labels[index].label,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
