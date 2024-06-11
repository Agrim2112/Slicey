import 'dart:developer';

import 'package:pizza_repository/pizza_repository.dart';
import 'package:pizza_repository/src/pizza_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebasePizzaRepo implements PizzaRepo{

  final pizzaCollection = FirebaseFirestore.instance.collection('pizzas');

  Future<List<Pizza>> getPizzas() async {
    try{
      return await pizzaCollection
          .get()
          .then((value) => value.docs.map((e) =>
            Pizza.fromEntity(PizzaEntity.fromDocument(e.data()))
      ).toList());
    }
    catch(e) {
      log(e.toString());
      rethrow;
    }
  }
}