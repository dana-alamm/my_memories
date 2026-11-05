
import 'package:my_memories/core/data/modals/weather_model.dart';


import 'package:my_memories/core/network/api_constants.dart';
import 'package:my_memories/core/network/dio_helper.dart';

class WeatherService {
 static Future<WeatherModel?>getWeather({
  required double lat,
  required double lon,
 })async{
  try {
    final response=await DioHelper.dio.get(
      '',
      queryParameters: {
        'lat':lat,
        'lon':lon,
        'appid':ApiConstants.apiKey,
        'units':'metric',
      },
    );
    if(response.statusCode==200){
      return WeatherModel.fromJson(response.data);
    }
  } catch (e) {
    print('Error fetching weather: $e');
  }
  return null;
 }

}