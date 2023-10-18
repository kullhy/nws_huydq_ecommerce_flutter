class SignUpUser {
  String? name;
  String? email;
  String? password;
  String? avatar;

  SignUpUser({this.name, this.email, this.password, this.avatar});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['avatar'] = avatar;
    return data;
  }
}
