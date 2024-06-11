import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slicey/components/macro.dart';
import 'package:pizza_repository/pizza_repository.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsScreen extends StatelessWidget {
  final Pizza pizza;
  const DetailsScreen(this.pizza,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: const Column(
          children: [
            Text(
                  "SLICEY",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30.0),
                ),
            SizedBox(height: 8.0,)
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0,30.0,20.0,0.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width-(40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                  offset: const Offset(3, 3),
                  color: Colors.grey.shade300,
                )
                ],
                image: DecorationImage(image: NetworkImage(
                  pizza.picture
                )
                )
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(3, 3),
                      color: Colors.grey.shade300,
                    )
                  ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pizza.name,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "₹${pizza.discount}",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary
                          ),
                        ),
                        Text(
                          "₹${pizza.price}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700,
                              decoration: TextDecoration.lineThrough
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        MacroWidget(value: pizza.macros.calories, title: "Calories",icon: FontAwesomeIcons.fire),
                        const SizedBox(width: 10),
                        MacroWidget(value: pizza.macros.proteins, title: "Protein",icon: FontAwesomeIcons.dumbbell),
                        const SizedBox(width: 10,),
                        MacroWidget(value:  pizza.macros.fats, title: "Fat",icon: FontAwesomeIcons.oilWell),
                        const SizedBox(width: 10),
                        MacroWidget(value:  pizza.macros.carbs, title: "Carbs",icon: FontAwesomeIcons.breadSlice),
                        const SizedBox(width: 10,)
                      ],
                    ),
                    const SizedBox(height: 30.0,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          },
                        style: TextButton.styleFrom(
                          elevation: 3.0,
                          backgroundColor: Colors.black.withOpacity(0.9),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        child: const Text(
                          "Buy Now",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                          ),
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
