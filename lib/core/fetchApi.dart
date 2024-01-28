
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import 'package:taxiapp/core/checkinternet.dart';
import 'dart:convert';

import 'package:taxiapp/core/stateRequset.dart';
import 'package:taxiapp/services/services.dart';

class FetchApi {
  
  Future<Either<StatusRequest, Map>> postData(String urllink, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(urllink), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }
  MyServices myServices=Get.find();

  Future<Either<StatusRequest, Map>> getData(
      String urllink, String token) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(
          Uri.parse(urllink),
          headers: {
            // 'Authorization': 'Token 4025cae813550d836f4d7aa0743d319ad3f906f0',            
            'Authorization': 'Token ${myServices.token}',            
            'Content-Type': 'application/json',
          },
        );      
        print(response.body);
        
        if (response.statusCode == 200 || response.statusCode == 201) {
          final String decodedBody = utf8.decode(response.bodyBytes);
          Map responseBody = jsonDecode(decodedBody);
          if (responseBody['results'].isEmpty) {
            return const Left(StatusRequest.noData);
          } else {
            return Right(responseBody);
          }
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }
}
