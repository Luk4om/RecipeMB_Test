import 'package:flutter/material.dart';
import 'package:recipe/models/recipe.api.dart';
import 'package:recipe/views/widgets/recipe_card.dart';
import '../models/recipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> recipes;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipe();
  }

  Future<void> getRecipe() async {
    recipes = await RecipeAPI.getRecipe();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.restaurant_menu),
          SizedBox(
            width: 10,
          ),
          Text("All Recipe")
        ]),
      ),
      body: const RecipeCard(
        title: "Ez Korean Sticky Chicken",
        cookTime: "20 min",
        rating: "4.0",
        thumbnailUrl:
            "https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360",
      ),
      // body: isLoading
      //     ? const Center(child: CircularProgressIndicator())
      //     : ListView.builder(
      //         itemCount: recipes.length,
      //         itemBuilder: (context, index) {
      //           return RecipeCard(
      //               title: recipes[index].name,
      //               cookTime: recipes[index].totalTime,
      //               rating: recipes[index].rating.toString(),
      //               thumbnailUrl: recipes[index].images);
      //         })
    );
  }
}
