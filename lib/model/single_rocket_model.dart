class SingleRocketModel {
  SingleRocketModel({
    required this.height,
    required this.diameter,
    required this.flickrImages,
    required this.name,
    required this.active,
    required this.costPerLaunch,
    required this.successRatePct,
    required this.wikipedia,
    required this.description,
  });

  Diameter height;
  Diameter diameter;
  List<String> flickrImages;
  String name;
  bool active;
  dynamic costPerLaunch;
  dynamic successRatePct;
  String wikipedia;
  String description;

  factory SingleRocketModel.fromJson(Map<String, dynamic> json) =>
      SingleRocketModel(
        height: Diameter.fromJson(json["height"]),
        diameter: Diameter.fromJson(json["diameter"]),
        flickrImages: List<String>.from(json["flickr_images"].map((x) => x)),
        name: json["name"],
        active: json["active"],
        costPerLaunch: json["cost_per_launch"],
        successRatePct: json["success_rate_pct"],
        wikipedia: json["wikipedia"],
        description: json["description"],
      );
}

class Diameter {
  Diameter({
    required this.feet,
  });

  dynamic feet;

  factory Diameter.fromJson(Map<String, dynamic> json) => Diameter(
        feet: json["feet"],
      );
}
