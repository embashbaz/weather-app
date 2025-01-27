import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/weather_data_entity.dart';

class DatabaseService {
  late Database database;

  Future<void> init() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'weather_database.db'),
      onCreate: _createTable,
      version: 1,
    );
  }

  Future _createTable(Database db, int version) async {
    await db.execute(
      'CREATE TABLE weatherDataEntity(cityId INTEGER PRIMARY KEY, cityName TEXT, weatherObject TEXT, timeAdded INTEGER)',
    );
  }

  Future<int> addUpdateWeatherDataEntity(WeatherEntity entity) async {
    return database.insert("weatherDataEntity", entity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<WeatherEntity>> getLastUpdatedWeatherData() async {
    var dbResponse = await database.query("weatherDataEntity",
        orderBy: "timeAdded DESC", limit: 1);
    return dbResponse.map((e) => WeatherEntity.fromJson(e)).toList();
  }

  Future<List<WeatherEntity>> getWeatherData(int cityId) async {
    var dbResponse = await database.query("weatherDataEntity",
        where: 'cityId = ?', whereArgs: [cityId]);
    return dbResponse.map((e) => WeatherEntity.fromJson(e)).toList();
  }
}