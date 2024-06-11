import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slicey/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:slicey/screens/home/views/details_screen.dart';

import '../blocs/get_pizza_bloc/get_pizza_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: Row(
          children: [
            Image.asset(
              'assets/img_7.png',
              scale: 15,
            ),
            const SizedBox(
              width: 8.0,
            ),
            const Text(
              "SLICEY",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30.0),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.cart)),
          IconButton(
              onPressed: () {
                context.read<SignInBloc>().add(SignOutRequired());
              },
              icon: const Icon(CupertinoIcons.arrow_right_to_line))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<GetPizzaBloc, GetPizzaState>(
          builder: (context, state) {
            if(state is GetPizzaSuccess) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 9 / 16),
                  itemCount: state.pizzas.length,
                  itemBuilder: (context, int i) {
                    return Material(
                      elevation: 3,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                DetailsScreen(
                                  state.pizzas[i]
                                ),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FadeInImage(
                                placeholder: AssetImage('assets/img_8.png'),
                                image: NetworkImage(state.pizzas[i].picture),
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(

                                          color: state.pizzas[i].isVeg ? Colors.green.shade500 : Colors.red,
                                          borderRadius:
                                          BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        child: Text(
                                          state.pizzas[i].isVeg? "VEG":"NON-VEG",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8.0),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.green.shade50,
                                          borderRadius:
                                          BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        child: Text(
                                          state.pizzas[i].spicy==1
                                              ? "🌶️ BLAND"
                                              : state.pizzas[i].spicy==2
                                              ? "🌶️ BALANCED"
                                              : "🌶️ SPICY",
                                          style: TextStyle(
                                              color:  state.pizzas[i].spicy==1
                                                  ? Colors.green
                                                  : state.pizzas[i].spicy==2
                                                  ? Colors.orange
                                                  : Colors.red,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.0),
                                child: Text(
                                  state.pizzas[i].name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Text(
                                  state.pizzas[i].description,
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 1.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "₹${state.pizzas[i].discount}",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Theme
                                                  .of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          "₹${state.pizzas[i].price}",
                                          style: TextStyle(
                                            decoration:
                                            TextDecoration.lineThrough,
                                            fontSize: 14.0,
                                            color: Colors.grey.shade500,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                            CupertinoIcons.add_circled_solid))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
            else if ( state is GetPizzaLoading ){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else{
              return const Center(
                child: Text(
                  "An error occurred, please try again.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                  ),
                ),
              );
            }
          },

        ),
      ),
    );
  }
}
