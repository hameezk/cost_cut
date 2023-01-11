class UserModel {
  String? id;
  String? name;
  String? email;
  String? phoneno;
  String? post_code;
  String? d_address;
  String? username;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneno,
    required this.d_address,
    required this.post_code,
    required this.username,
  });

  UserModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    email = map["email"];
    phoneno = map["phoneno"];
    post_code = map["post_code"];
    d_address = map["d_address"];
    username = map["username"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phoneno": phoneno,
      "post_code": post_code,
      "d_address": d_address,
      "username": username,
    };
  }

  static UserModel? loggedinUser;
}
