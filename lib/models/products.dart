import 'package:flutter/material.dart';

class Product{
  int? id;
  String? img;
  String? name;
  String? category;
  int? numView;
  int? quantity;
  double? price;

  Product({
   required this.id,
   required this.img,
   required this.name,
   required this.numView,
   required this.quantity,
   required this.category,
   required this.price
  });
}

List<Product> products = [
  Product(
    id: 1,
    category: 'Fruits',
    img: 'assets/images/Bis.png',
    name: 'Bis',
    numView: 10,
    price: 33,  quantity: 10,
  ),
  //   Product(
    // id: 2,
  //   img: 'assets/images/Bis.png',
  //   name: 'Twix1',
  //   numView: 30,
  //   price: 10,
  // ),
  //   Product(
    // id: 3,
  //   img: 'assets/images/Bis.png',
  //   name: 'Bis2',
  //   numView: 500,
  //   price: 61,
  // ),
  //   Product(
    // id: 4,
  //   img: 'assets/images/Bis.png',
  //   name: 'Bonna',
  //   numView: 100,
  //   price: 69,
  // ),
  //   Product(
    // id: 5,
  //   img: 'assets/images/Bis.png',
  //   name: 'COCOHAOA',
  //   numView: 36,
  //   price: 65,
  // ),
  //   Product(
    // id: 6,
  //   img: 'assets/images/Bis.png',
  //   name: 'HOLAO',
  //   numView: 45,
  //   price: 93,
  // ),
];