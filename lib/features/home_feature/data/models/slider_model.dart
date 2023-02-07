import '../../domain/entities/slider_entities.dart';

class SliderModel extends SliderEntities {
  SliderModel({
    this.image,
  }) : super(image: image);

  String? image;

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}
