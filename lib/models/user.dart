class User{
  int? id;
  String? name;
  String? token;
  String? email;

  User({this.id, this.name, this.token, this.email});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      email: json['user']['email'],
      token: json['token'],
    );
  }
}