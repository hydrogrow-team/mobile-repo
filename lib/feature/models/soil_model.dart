class SoilModel {
  final int nMean;
  final int phMean;

  SoilModel({required this.nMean, required this.phMean});
  factory SoilModel.fromJson(Map<String,dynamic>json){
    return SoilModel(
    nMean: json['data']['nitrogen']['mean'],
    phMean: (json['data']['phh2o']['mean'])/10);
  }
}