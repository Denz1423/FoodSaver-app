import 'package:flutter/material.dart';

import '../widgets/recipeList_vm.dart';

class RecipeListScreen extends StatelessWidget {
  static const routeName = '/recipeList-screen';

  const RecipeListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final labelTitle = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(labelTitle),
      ),
      body: GridView(
          padding: const EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 35,
          ),
          children: [  
            RecipeListVM(labelTitle),
            RecipeListVM(labelTitle),
            RecipeListVM(labelTitle),
            RecipeListVM(labelTitle),
            RecipeListVM(labelTitle),
            RecipeListVM(labelTitle),
            RecipeListVM(labelTitle),
            RecipeListVM(labelTitle),
            RecipeListVM(labelTitle),
            RecipeListVM(labelTitle),
            RecipeListVM(labelTitle),
            RecipeListVM(labelTitle),
          ]),
    );
  }
}
