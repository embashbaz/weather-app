# weather_app

Waether app for Craft Silicon Limited

## Running the code

add a file inside https://github.com/embashbaz/weather-app/tree/master/lib/data/remote/api and name it weather_res.dart
Add the following to the file
```
String BASE_URL = "https://api.openweathermap.org/data/2.5/forecast";
String API_KEY = PROVIDE_KEY;
```

With the Open weather map api key. 

Please note that the key provided was not working so I created a new one.

A screenshot of the app can be found at Screenshot_20250127_163910.png https://github.com/embashbaz/weather-app/blob/master/Screenshot_20250127_163910.png

## Chanllenge

Offline support was a bit of a chanllenge, I used a callback function to display cached data first, then if we get the api data, display them. Wish could use something like Flow that is on Android. SQlite on Flutter is still very limited and cumbersome.

Just realised I didn't not do the part about current weather data.
