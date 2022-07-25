class User {
  UserData? userData;
  String? token;

  User({this.userData, this.token});

  User.fromJson(Map<String, dynamic> json) {
    userData = json['user'] != null ? UserData.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userData != null) {
      data['user'] = userData!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class UserData {
  int? id;
  String? email;
  String? username;
  String? firstName;
  String? lastName;
  String? avatar;

  UserData({
    this.id,
    this.email,
    this.username,
    this.firstName,
    this.lastName,
    this.avatar
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    return data;
  }
}