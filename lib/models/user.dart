class User {
  String? name;
  String? phone_number;
  String? email;
  String? password;

  User({this.name, this.phone_number, this.email, this.password});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone_number = json['phone_number'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone_number'] = name;
    data['email'] = name;
    data['password'] = name;
    return data;
  }
}
