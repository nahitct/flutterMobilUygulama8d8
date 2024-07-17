class User {
  int? id;
  String? name;
  String? surname;
  String? number;
  User.withId({
    required this.id,
    required this.name,
    required this.surname,
    required this.number,
  });
  User({
    required this.name,
    required this.surname,
    required this.number,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    surname = json["surname"];
    number = json["number"];
  }
  factory User.fromJsonWithId(Map<String, dynamic> json) {
    return User.withId(
      id: json["id"] as int?,
      name: json["name"] as String?,
      surname: json["surname"] as String?,
      number: json["number"] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'number': number,
    };
  }
}
