import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/logic/weather_bloc.dart';
import 'package:weather_app/presentation/all_weather_data_page.dart';
import 'package:weather_app/presentation/size_config.dart';

import 'data/local/db_helper/db_helper.dart';
import 'data/remote/api/api_service.dart';
import 'data/repo/main_repository.dart';
import 'data/repo/main_repository_implementation.dart';
import 'domain/model/weather_model.dart';

final dbService = DatabaseService();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dbService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MainRepository>(
            create: (_) => MainRepositoryImplementation(
              DioHttpService(),
              dbService,
            ))
      ],
      child: Builder(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (_) =>
                    WeatherBloc(RepositoryProvider.of<MainRepository>(context))
                      ..add(EmptyEvent())),

              ],
              child: MaterialApp(
                title: 'Weather app',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    useMaterial3: false,
                    primaryColor: Colors.deepOrangeAccent,
                    appBarTheme:
                    const AppBarTheme(titleTextStyle: TextStyle(fontSize: 18)),
                    colorScheme: const ColorScheme.light(
                      primary: Colors.deepOrangeAccent,
                      secondary: Colors.deepPurpleAccent,
                      background: Colors.white,
                    )),
                home: WeatherDataPage(),
              ),
            );
          }
      ),
    );
  }
}
