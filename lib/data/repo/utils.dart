

import 'package:dartz/dartz.dart';

import '../remote/api/utils.dart';
import '../remote/model/weather_response.dart';

typedef WeatherDataResponse = Future<Either<WeatherAppError, WeatherResponse>?>;