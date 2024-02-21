import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges_acceptance/models/product_item_model.dart';
import 'package:flutter_challenges_acceptance/utils/app_colors.dart';
import 'package:flutter_challenges_acceptance/utils/route/app_routes.dart';
import 'package:flutter_challenges_acceptance/view_models/home_cubit/home_cubit.dart';
import 'package:flutter_challenges_acceptance/views/widgets/custom_carousel_indicatior.dart';
import 'package:flutter_challenges_acceptance/views/widgets/product_item.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      buildWhen: (previous, current) =>
          current is HomeLoading ||
          current is HomeLoaded ||
          current is HomeError,
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is HomeError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is HomeLoaded) {
          final products = state.products;
          final announcements = state.announcements;
          return SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCarouselIndicator(announcements: announcements),
                  const SizedBox(height: 16.0),
                  GridView.builder(
                    itemCount: products.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return InkWell(
                        onTap: () => Navigator.of(context, rootNavigator: true)
                            .pushNamed(
                          AppRoutes.productDetails,
                          arguments: product,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.network(
                                product.imgUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '${product.category} - \$${product.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.normal,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            IconButton(
                              icon: Icon(
                                product.isFavorited
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: AppColors.red,
                              ),
                              onPressed: () {
                                cubit.toggleFavoriteStatus(product);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
