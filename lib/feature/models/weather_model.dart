class WeatherModel{
  final List<Days>days;

  WeatherModel({required this.days});
  factory WeatherModel.fromJson(Map<String,dynamic>json){
    return WeatherModel(
        days:  (json['data']['days'] as List)
        .map((e) => Days.fromJson(e))
        .toList());
  }
}
class Days{
  final double temp;
  final double humidity;
  final double dew;

  Days({required this.temp, required this.humidity, required this.dew});

  factory Days.fromJson(Map<String,dynamic>json){
    double tempVal=(json['temp'] -32)/1.8;
    return Days(temp: json['temp'].toDouble(), humidity: json['humidity'].toDouble(), dew: json['dew'].toDouble());
  }
}
