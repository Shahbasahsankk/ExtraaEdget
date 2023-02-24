class AllRocketsModel {
  AllRocketsModel({
    required this.firstStage,
    required this.secondStage,
    required this.flickrImages,
    required this.name,
    required this.country,
    required this.id,
  });

  FirstStage firstStage;
  SecondStage secondStage;
  List<String> flickrImages;
  String name;
  String country;
  String id;

  factory AllRocketsModel.fromJson(Map<String, dynamic> json) =>
      AllRocketsModel(
        firstStage: FirstStage.fromJson(json["first_stage"]),
        secondStage: SecondStage.fromJson(json["second_stage"]),
        flickrImages: List<String>.from(json["flickr_images"].map((x) => x)),
        name: json["name"],
        country: json["country"],
        id: json["id"],
      );
}

class FirstStage {
  FirstStage({
    required this.engines,
  });

  int engines;

  factory FirstStage.fromJson(Map<String, dynamic> json) => FirstStage(
        engines: json["engines"],
      );
}

class SecondStage {
  SecondStage({
    required this.engines,
  });

  int engines;

  factory SecondStage.fromJson(Map<String, dynamic> json) => SecondStage(
        engines: json["engines"],
      );
}
