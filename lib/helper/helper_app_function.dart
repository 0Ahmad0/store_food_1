import 'package:flutter/material.dart';

/// get Screen Size
Size getScreenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

/// Navigator Between Screens
void goTo({
  required context,
  required widget,
}) {
  Navigator.push(context, MaterialPageRoute(builder: (ctx) => widget));
}

/// TabsBar Controller List
List<String> tabsBar = [
    'Fruits',
    'Snacks',
    'Meat',
    'Shoes',
    'Cloths',
    'Vegetable',

];

/// test List
Map<String, List<dynamic>> testMap = {
  "Fruits": [
    // { "category": 'Fruits' ,"id": 1, "name": "banana", "image": "images/banana.png"},
    // { "category": 'Fruits' ,"id": 2, "name": "Apple", "image": "images/apple.png"},
    // { "category": 'Fruits' ,"id": 3, "name": "Strawberry", "image": "images/Strawberry.png"},
    // { "category": 'Fruits' ,"id": 4, "name": "Lemmon", "image": "images/Lemmon.png"},
   ],
  "Snacks": [
    { "category": 'Snacks' ,"id": 1, "name": "Doritos", "image": "images/Doritos.png"},
    { "category": 'Snacks' ,"id": 2, "name": "Nutella", "image": "images/Nutella.png"},
    { "category": 'Snacks' ,"id": 3, "name": "Pepsi", "image": "images/Pepsi.png"},
  ],
  "Meat": [
    { "category": 'Meat' ,"id": 1, "name": "RedMeat", "image": "images/RedMeat.png"},
    { "category": 'Meat' ,"id": 2, "name": "ChickenMeat", "image": "images/ChickenMeat.png"},
    { "category": 'Meat' ,"id": 3, "name": "RedMeat2", "image": "images/RedMeat2.png"},
    { "category": 'Meat' ,"id": 4, "name": "ChickenMeat2", "image": "images/ChickenMeat2.png"},
    { "category": 'Meat' ,"id": 5, "name": "FishMeat2", "image": "images/FishMeat2.png"},
    { "category": 'Meat' ,"id": 6, "name": "FishMeat", "image": "images/FishMeat.png"},
  ],
  "Shoes": [
    { "category": 'Shoes' ,"id": 1, "name": "Shoes1", "image": "images/shoes1.png"},
    { "category": 'Shoes' ,"id": 2, "name": "Shoes2", "image": "images/shoes2.png"},
    { "category": 'Shoes' ,"id": 3, "name": "Sandel", "image": "images/shoes3.png"},
  ],
  "Cloths": [
    { "category": 'Cloths' ,"id": 1, "name": "Jacket", "image": "images/jacket.png"},
    { "category": 'Cloths' ,"id": 2, "name": "Hat", "image": "images/hat.png"},
    { "category": 'Cloths' ,"id": 3, "name": "backpack", "image": "images/backpack.png"},
    { "category": 'Cloths' ,"id": 4, "name": "Jeans", "image": "images/jeans.png"},
  ],
  "Vegetable": [
    { "category": 'Vegetable' ,"id": 1, "name": "Carot", "image": "images/Carot.png"},
    { "category": 'Vegetable' ,"id": 2, "name": "Bottato", "image": "images/Bottato.png"},
  ],
};
