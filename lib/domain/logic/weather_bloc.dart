import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/remote/api/utils.dart';
import 'package:weather_app/data/remote/model/weather_response.dart';

import '../../data/repo/main_repository.dart';
import '../model/weather_model.dart';

class WeatherBloc extends Bloc<AppEvent, AppState> {
  final MainRepository _repository;

  WeatherBloc(
    this._repository,
  ) : super(EmptyState()) {
    on<EmptyEvent>((event, emit) async {
      emit(EmptyState());
    });

    on<WeatherAppEvent>((event, emit) async {
      _repository.getData((Either<WeatherAppError, WeatherResponse>? res) {
        emit(LoadingState());
        res?.fold((l) {
          emit(ErrorState(
              l.displayMessage ?? l.message ?? "Could not fetch data"));
        }, (r) {
          emit(WeatherAppState(r));
        });
      }, cityName: event.cityName, cityId: null);
    });
  }
}
