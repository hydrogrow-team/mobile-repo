class PredictionModel {
  final String prediction;
  final String description;

  PredictionModel({required this.prediction, required this.description});

  factory PredictionModel.fromJson(Map<String, dynamic> json) {
    return PredictionModel(
        prediction: json['data']['prediction'],
        description: json['data']['description']);
  }
}
