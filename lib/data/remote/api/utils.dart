import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/error_model.dart';

/**
 * I mostly imported this from a previous project
 */

typedef NetworkResponse = Future<Either<WeatherAppError, Response>>;

NetworkResponse apiCall(Future<Response> Function() call) async {
  Response response;
  try {
    response = await call();
  } on DioException catch (e) {
    WeatherAppError finalError = WeatherAppError(
        displayMessage:
            "An error occurred, please check your internet connection, if the error persit get in touch with us");

    if (e.response?.statusCode != null) {
      ErrorDetailsResponse? apiError;
      try{
        debugPrint("exception is ${e.response?.data}");
        apiError = ErrorDetailsResponse.fromJson(e.response?.data);

      } catch(e){
        debugPrint("exception is ${e}");
        apiError = null;
      }


      finalError = WeatherAppError(
          code: e.response?.statusCode,
          message: apiError?.message ?? e.message,
          displayMessage: getMessageToDisplayForErrorCode(e.response?.statusCode,
              e.response?.statusMessage ?? "An error occurred", apiError: apiError),
          );
    }

    return Left(finalError);
  }
  return Right(response);
}

class WeatherAppError {
  int? code;
  String? message;
  String? displayMessage;

  WeatherAppError({this.code, this.message, this.displayMessage});
}

String? getMessageToDisplayForErrorCode(
  int? code,
  String? message, {
  ErrorDetailsResponse? apiError,
  String? backendMessage,
}) {
  if (code == null) {
    return message;
  }
  if (code == 404) {
    return "The resource you are looking for was not found";
  } else if (code >= 500 && code <= 599) {
    return "An error occurred on our end, please try again later. If the issue persists, get in touch with us.";
  } else if (code == 401) {
    return "401";
  } else if (code == 403) {
    return "You do not have the necessary permission to perform this action";
  } else if (code == 400) {
    return "There seems to be a problem at our end. Please bear with us as we look into it.";
  } else if (code == 402) {
    return "Payment Required";
  } else {
    return
        apiError?.message ??
        "An error $code occurred";
  }
}
