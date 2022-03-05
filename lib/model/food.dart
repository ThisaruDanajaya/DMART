
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class Food{
  late String id;
  late String name;
  late String category;
  late String image;
  late List subIngredients;
  late Timestamp createdAt;

  Food.fromMap(Map<String,dynamic> data){
    id = data['id'];
    name = data['name'];
    category = data['category'];
    image = data['image'];
    subIngredients = data['subIngredients'];
    createdAt = data['createdAt'];
  }
}

