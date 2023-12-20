import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:taxiapp/controllers/auth/auth_controller.dart';
import 'package:taxiapp/core/checkinternet.dart';
import 'dart:convert';

import 'package:taxiapp/core/stateRequset.dart';

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

  Future<Either<StatusRequest, Map>> getData(
      String urllink, String token) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(
          Uri.parse(urllink),
          headers: {
            'Authorization': 'Token $token',
            // 'Authorization': 'Token 5ed29fbc5bc2fdb1e1f9b1c0db8f72f6c65235dc',
            'Content-Type': 'application/json',
          },
        );      
        
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
