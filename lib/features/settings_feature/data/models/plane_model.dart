import '../../domain/entities/plane_entities.dart';

class PlaneModel extends PlaneEntities {
  PlaneModel({
    this.id,
    this.name,
    this.offerPercentage,
    this.offerPrice,
    this.price,
    this.tokens,
  }) : super(
          name: name,
          id: id,
          offerPercentage: offerPercentage,
          offerPrice: offerPrice,
          price: price,
          tokens: tokens,
        );

  String? id;
  String? name;
  String? offerPercentage;
  String? offerPrice;
  String? price;
  String? tokens;

  factory PlaneModel.fromJson(Map<String, dynamic> json) => PlaneModel(
        id: json["_id"],
        name: json["name"],
        offerPercentage: json["offer_percentage"],
        offerPrice: json["offer_price"],
        price: json["price"],
        tokens: json["tokens"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "offer_percentage": offerPercentage,
        "offer_price": offerPrice,
        "price": price,
        "tokens": tokens,
      };
}
