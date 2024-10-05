class RainFallModel {
  final bool status;
  final String message;
  final List<DataModel> data;

  RainFallModel({required this.status, required this.message, required this.data});

  factory RainFallModel.fromJson(Map<String, dynamic> json) {
    return RainFallModel(
        status: json['success'],
        message: json['message'],
        data: (json['data']['data'] as List)
            .map((e) => DataModel.fromJson(e))
            .toList());
  }
}


class DataModel {
  final int month;
  final int day;
  final int avg;

  DataModel({required this.month, required this.day, required this.avg});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        month: json['month'], day: json['day'], avg: json['value']['avg'].toInt());
  }
}
