class SignUpParam {
  String? name;
  String? email;
  String? password;

  SignUpParam({this.name, this.email, this.password});
}

class SignInParam {
  String? name;
  String? email;
  String? password;

  SignInParam({this.name, this.email, this.password});
}

class SettingParams {
  int? id;
  String? name;
  String? image;
  Function? onTap;

  SettingParams({this.id, this.name, this.image, this.onTap});
}
