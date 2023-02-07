import '../../domain/entities/category_entitie.dart';

class CategoryModel extends CategoryEntities {
  CategoryModel({
    this.id,
    this.color,
    this.image,
    this.name,
    this.categoryId,
    this.prompt,
  }) : super(
          color: color,
          image: image,
          name: name,
          categoryId: categoryId,
          id: id,
          prompt: prompt,
        );

  String? id;
  String? color;
  String? image;
  String? name;
  String? categoryId;
  String? prompt;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["_id"],
        color: json["color"],
        image: json["image"],
        name: json["name"],
        categoryId: json["category_id"],
        prompt: json["prompt"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "color": color,
        "image": image,
        "name": name,
        "category_id": categoryId,
        "prompt": prompt,
      };
}
