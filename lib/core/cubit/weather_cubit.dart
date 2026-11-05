import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_memories/core/cubit/weather_state.dart';
import 'package:my_memories/core/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
WeatherCubit():super(WeatherInitial());

Future<void>fetchWeather(double lat,double lon)async{
  emit(WeatherLoading());

  try {
    final weatherData=await WeatherService.getWeather(lat: lat, lon: lon);

    if(weatherData !=null){
      emit(WeatherLoaded(weatherData));
    }else{
      emit(WeatherError("We can't find data"));
    }
  } catch (e) {
    emit(WeatherError('$e'));
  }
}
}