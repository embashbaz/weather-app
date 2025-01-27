import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/data/remote/model/weather_response.dart';

@immutable
abstract class AppState extends Equatable{
  AppEvent? get event => null;
  const AppState();

}

@immutable
abstract class AppEvent extends Equatable{
  const AppEvent();
}


class WeatherAppState extends AppState {

  WeatherResponse? weatherData;
  WeatherAppState(this.weatherData);
  @override
  List<Object?> get props => [weatherData];

}



class WeatherAppEvent extends AppEvent {

  String? cityName;
  WeatherAppEvent(this.cityName);
  @override
  List<Object?> get props => [cityName];

}

class EmptyEvent extends AppEvent {
  @override
  List<Object?> get props => [];
}


class EmptyState extends AppState {
  @override
  List<Object?> get props => [];

}

class ErrorState extends AppState {
  int? code;
  String message;


  ErrorState(this.message, {this.code});

  @override
  List<Object?> get props => [message, code];

}

class LoadingState extends AppState {
  @override
  List<Object?> get props => [];

}