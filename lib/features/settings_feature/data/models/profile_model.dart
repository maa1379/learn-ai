import '../../domain/entities/profile_entities.dart';

class ProfileModel extends ProfileEntities {
  ProfileModel({
    this.email,
    this.tokens,
    this.inviteesCount,
  }) : super(tokens: tokens, email: email, inviteesCount: inviteesCount);

  String? email;
  int? tokens;
  int? inviteesCount;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        email: json["email"],
        tokens: json["tokens"],
        inviteesCount: json["invitees_count"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "tokens": tokens,
        "invitees_count": inviteesCount,
      };
}
