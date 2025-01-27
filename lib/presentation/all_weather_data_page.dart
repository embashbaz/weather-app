import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/remote/model/weather_response.dart';
import 'package:weather_app/domain/logic/list_utils.dart';
import 'package:weather_app/domain/logic/utils.dart';
import 'package:weather_app/domain/logic/weather_bloc.dart';
import 'package:weather_app/domain/model/weather_model.dart';
import 'package:weather_app/presentation/size_config.dart';
import 'package:weather_app/presentation/weather_item.dart';

class WeatherDataPage extends StatefulWidget {
  const WeatherDataPage({super.key});

  @override
  State<WeatherDataPage> createState() => _WeatherDataPageState();
}

class _WeatherDataPageState extends State<WeatherDataPage> {
  bool _isLoading = false;

  String? _searchTerm = "Nairobi";

  WeatherResponse? _weatherResponse;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    context.read<WeatherBloc>().add(WeatherAppEvent(_searchTerm));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<WeatherBloc, AppState>(
          listener: (_, state) {
            setState(() {
              _isLoading = state is LoadingState;
            });
            if (state is WeatherAppState) {
              setState(() {
                _weatherResponse = state.weatherData;
              });
            }

            if(state is ErrorState){
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  clipBehavior: Clip.none,
                  backgroundColor: Colors.white,
                  content: Row(
                    children: [
                      Flexible(flex: 1, child: Icon(Icons.cancel, color: Colors.red,)),
                      const SizedBox(width: 8,),
                      Flexible(
                        flex: 7,
                        child: Text(
                          state.message ?? "An error occurred",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8,),
                      Flexible(
                          flex: 2,
                          child: TextButton(onPressed: (){
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            getData();
                          }, child: Text( "Retry", style: const TextStyle(color: Colors.green),)))
                    ],
                  )));
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric( horizontal: 16),
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade200),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                          onChanged: (value) {
                            _searchTerm = value;
                          },
                          decoration: const InputDecoration(
                            hintText:
                                "Type the name the city then tap on search",
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.text),
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal! * 5),
                    InkWell(
                      child: Icon(Icons.search),
                      onTap: () {
                        getData();
                      },
                    ),
                  ],
                ),
              ),
              _isLoading ? LinearProgressIndicator() : SizedBox(),
              if (_weatherResponse != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                _weatherResponse?.list.firstOrNull?.dt?.getDateTimeFromInt().getFormatedTime() ??
                                    "N/a",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "${_weatherResponse?.list.firstOrNull?.main?.temp ?? "--"}°C",
                                style: const TextStyle(
                                  fontSize: 42,
                                  color: Colors.black,
                                ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "${_weatherResponse?.list.firstOrNull?.weather.firstOrNull?.description ?? "--"}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                _weatherResponse?.city?.name ?? "",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),),
                            ),
                          ]),
                      Image(
                        image: NetworkImage(
                            "https://openweathermap.org/img/wn/${_weatherResponse?.list.firstOrNull?.weather.firstOrNull?.icon ?? "10d"}@4x.png"),
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade200),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _weatherResponse?.list?.length ?? 0,
                      //scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return WeatherItemWidget(
                          weatherItem: _weatherResponse!.list![index],
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
