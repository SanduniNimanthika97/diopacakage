class User {
  int id;
  String districts, province;

  User({
    required this.id,
    required this.province,
    required this.districts,
  });

  factory User.fromJSON(Map<String, dynamic> parsedJson) {
    return User(
      id: parsedJson["id"],
      province: parsedJson["province"],
      districts: parsedJson["districts"],
    );
  }
}

class User1 {
  int id;
  String districts, province;

  User1({
    required this.id,
    required this.province,
    required this.districts,
  });

  factory User1.fromJSON(Map<String, dynamic> parsedJson) {
    return User1(
      id: parsedJson["id"],
      province: parsedJson["province"],
      districts: parsedJson["districts"],
    );
  }
}
