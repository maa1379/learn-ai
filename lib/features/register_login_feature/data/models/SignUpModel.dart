import '../../domain/entities/sign_up_entities.dart';

class SignModel extends SignEntities {
  SignModel({
    this.name,
    this.email,
    this.jwt,
  }) : super(
          email: email,
          name: name,
          jwt: jwt,
        );

  String? name;
  String? email;
  String? jwt;

  factory SignModel.fromJson(Map<String, dynamic> json) => SignModel(
        name: json["name"],
        email: json["email"],
        jwt: json["jwt"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "jwt": jwt,
      };
}
