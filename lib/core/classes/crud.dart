import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_1/core/classes/status_request.dart';
import 'package:ecommerce_1/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class CRUD {
  Future<Either<StatusRequest, Map>> post(String url, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(url), body: data);
        // log(response.body.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      log(e.toString());
      return const Left(StatusRequest.serverException);
    }
  }
}
