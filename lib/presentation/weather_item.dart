import 'package:flutter/material.dart';
import 'package:weather_app/data/remote/model/weather_response.dart';
import 'package:weather_app/domain/logic/list_utils.dart';
import 'package:weather_app/domain/logic/utils.dart';

class WeatherItemWidget extends StatelessWidget {
  WeatherItemWidget({super.key, required this.weatherItem});

  WeatherList weatherItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image(
              image:
                  NetworkImage("https://openweathermap.org/img/wn/${weatherItem.weather.firstOrNull?.icon ?? "10d"}@2x.png"),
              height: 50,
              width: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${weatherItem.dt?.getJustDate() ??
                      "--"} | ${weatherItem.dt?.getJustTime() ??
                "--"}",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "${weatherItem.main?.temp ??
                        "--"}°C | ${weatherItem.weather.firstOrNull?.description ??
                        "--"}",
                  ),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Divider(height: 2,),
        )
      ],
    );
  }
}
