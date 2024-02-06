import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/product.dart';
import 'package:food_delivery_app/utils/app_routes.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://i.pinimg.com/564x/5d/8a/e4/5d8ae4c7f9639f2a67db4c28a9b5b306.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              favProducts.isEmpty
                  ? const SizedBox()
                  : Text('Hot Offer!',
                      style: Theme.of(context).textTheme.labelLarge),
              favProducts.isEmpty
                  ? const SizedBox()
                  : Expanded(
                      flex: 1,
                      child: FlutterCarousel.builder(
                        itemCount: favProducts.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color.fromRGBO(255, 255, 255, 0.498),
                              image: DecorationImage(
                                image: NetworkImage(
                                    favProducts[itemIndex % favProducts.length]
                                        .imgUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.5,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 2),
                        ),
                      ),
                    ),
              favProducts.isEmpty
                  ? const SizedBox()
                  : ElevatedButton(
                      onPressed: () => {}, child: const Text('Order Now!')),
              Expanded(
                flex: favProducts.isEmpty ? 3 : 2,
                child: favProducts.isEmpty
                    ? const Center(
                        child: Text(
                          'No favorite products yet.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: favProducts.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              right: 15.0,
                            ),
                            child: Card(
                              color: Colors.white.withOpacity(0.8),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20.0,
                                ),
                                child: ListTile(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(
                                            AppRoutes.productDetails,
                                            arguments: favProducts[index],
                                          )
                                          .then((value) => setState(() {}));
                                    },
                                    leading: Image.network(
                                      favProducts[index].imgUrl,
                                      height: 100,
                                      width: 70,
                                      fit: BoxFit.fill,
                                    ),
                                    title: Text(
                                      favProducts[index].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    subtitle: Text(
                                      '${favProducts[index].category.title} - \$${favProducts[index].price}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    trailing: Column(
                                      children: [
                                        orientation == Orientation.portrait
                                            ? IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    favProducts.remove(
                                                        favProducts[index]);
                                                  });
                                                },
                                                icon:
                                                    const Icon(Icons.favorite),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              )
                                            : TextButton.icon(
                                                onPressed: () {
                                                  setState(() {
                                                    favProducts.remove(
                                                        favProducts[index]);
                                                  });
                                                },
                                                icon:
                                                    const Icon(Icons.favorite),
                                                label: const Text('Favorite'),
                                              ),
                                      ],
                                    )),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
