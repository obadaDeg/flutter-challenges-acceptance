import 'package:flutter/material.dart';
import 'package:flutter_challenges_acceptance/models/product_item_model.dart';
import 'package:flutter_challenges_acceptance/utils/app_colors.dart';
import 'package:flutter_challenges_acceptance/utils/route/app_routes.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 10.0), // Adjust the padding for proper alignment
        itemCount:
            Favorites.length, // Make sure Favorites is a list of your items
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Adjust the number of items per row
          childAspectRatio: 0.8, // Adjust the aspect ratio of the items
          crossAxisSpacing: 10, // Adjust the spacing between items horizontally
          mainAxisSpacing: 10, // Adjust the spacing between items vertically
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.of(context, rootNavigator: true)
                .pushNamed(
                  AppRoutes.productDetails,
                  arguments:
                      Favorites[index], // Assuming this is how you pass details
                )
                .then((value) => setState(() {})),
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    Favorites[index].imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  Favorites[index].name,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '${Favorites[index].category} - \$${Favorites[index].price}',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                  textAlign: TextAlign.center,
                ),
                IconButton(
                  onPressed: () {
                    setState(
                      () {
                        Favorites.removeAt(
                            index); // Update to remove the item correctly
                      },
                    );
                  },
                  icon: const Icon(Icons.favorite),
                  color: AppColors.red,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
