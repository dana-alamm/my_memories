class WeatherModel {
  final int temp;
  final String description;

  WeatherModel({
    required this.temp,
    required this.description,
  });

  factory WeatherModel.fromJson(Map<String,dynamic>json){
    return WeatherModel(
      temp:(json['data'][0]['temp']as num).toInt(),
      description:json['data'][0]['weather'][0]['main'],

    );
  }

  
}