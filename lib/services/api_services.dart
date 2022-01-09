import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:fatema_1/models/user.dart';
import 'package:fatema_1/services/api_responce.dart';

import 'api_const.dart';


//Login
Future<ApiResponse> login(String email ,String password) async{
  ApiResponse apiResponse = ApiResponse();
  try{
    final response = await http.post(
        Uri.parse(loginUrl),
        headers: {
          'Accept' : 'application/json'
        },
        body: {
          'email':email,
          'password': password
        }

    );
    switch(response.statusCode){
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = someThingWrong;
    }
  }catch(e){
    apiResponse.error = servererror;
  }
  return apiResponse;
}

//Register
Future<ApiResponse> register(String name ,String email ,String password) async{
  ApiResponse apiResponse = ApiResponse();
  try{
    final response = await http.post(
        Uri.parse(registerUrl),
        headers: {
          'Accept' : 'application/json'
        },
        body: {
          'name': name,
          'email':email,
          'password': password,
          'confrim_password': password
        }

    );
    switch(response.statusCode){
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = someThingWrong;
    }
  }catch(e){
    apiResponse.error = servererror;
  }
  return apiResponse;
}

///////////////////
Future<ApiResponse> getuserdetails() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.post(
      Uri.parse(registerUrl),
      headers: {'Accept': 'application/json', 'access_token': 'barer $token'},
    );
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));

        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];

        break;
      default:
        apiResponse.error = someThingWrong;
    }
  } catch (e) {
    apiResponse.error = servererror;
  }
  return apiResponse;
}

Future<String> getToken() async {
  GetStorage pref = await GetStorage();
  return pref.read('access_token') ?? ' ';
}

Future<int> getUserId() async {
  GetStorage pref = await GetStorage();
  return pref.read('user_id') ?? 0;
}

Future<void> logout() async {
  GetStorage pref = await GetStorage();
  pref.remove('access_token');
}
/************************/
class AddLikeBody {
  final String like;
  final String userId;
  final String productId;

  AddLikeBody(
      {required this.like, required this.userId, required this.productId});

  Map<String, String> toMap() {
    return {
      'like':this.like ,
      'product_id' :this.productId ,
      'user_id':this.userId
    };
  }
}
/******************************/
class AddCommentBody {
  final String line;
  final String userId;
  final String productId;

  AddCommentBody(
      {required this.line, required this.userId, required this.productId});

  Map<String, String> toMap() {
    return {
      'line':this.line ,
      'product_id' :this.productId ,
      'user_id':this.userId
    };
  }
}
/***************************/
class AddProductBody {
  final String name;
  final String price;
  final String categoryId;
  final String expiryDate;
  final String pe1;
  final String pe2;
  final String pe3;
  final String discountPe1;
  final String discountPe2;
  final String discountPe3;
  final String userId;
  final String quantity;
  final String viewCount;

  AddProductBody(
      {required this.name,
        required this.price,
        required this.categoryId,
        required this.expiryDate,
        required this.pe1,
        required this.pe2,
        required this.pe3,
        required this.discountPe1,
        required this.discountPe2,
        required this.discountPe3,
        required this.userId,
        required this.quantity,
        required this.viewCount});

  Map<String, String> toMap() {
    return {
      'name': name,
      'price': price,
      // 'image': image,
      'category_id': categoryId,
      'exp_date': expiryDate,
      'pe1': pe1,
      'pe2': pe2,
      'pe3': pe3,
      'discount_pe1': discountPe1,
      'discount_pe2': discountPe2,
      'discount_pe3': discountPe3,
      'user_id': userId,
      'quantity': quantity,
      'view_count': viewCount,
    };
  }
}
/****************************/
