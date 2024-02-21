import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges_acceptance/models/cart_orders_model.dart';
import 'package:flutter_challenges_acceptance/view_models/cart_cubit/cart_cubit.dart';
import 'package:flutter_challenges_acceptance/views/widgets/counter_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('My Cart'),
            ),
            body: ListView.builder(
              itemCount: state.cartItems.length,
              itemBuilder: (context, index) {
                final item = state.cartItems[index];
                return ListTile(
                  leading: Checkbox(
                    value: item.isSelected,
                    onChanged: (bool? value) {
                      BlocProvider.of<CartCubit>(context)
                          .toggleSelection(item.id);
                    },
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name),
                      Text('Color: ${item.color ?? "N/A"}'),
                      // Add size if you need it in the same manner
                    ],
                  ),
                  subtitle: CounterWidget(
                    cubit: BlocProvider.of<CartCubit>(context),
                    counter: item.quantity,
                  ),
                  trailing: Text('\$${item.price.toStringAsFixed(2)}'),
                  onTap: () {
                    // Handle item tap if necessary
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
