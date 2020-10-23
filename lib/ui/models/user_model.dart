class UserModel {
  String name;
  String age;
  double weight;
  double height;

  UserModel({this.name, this.age, this.weight, this.height}) {
    print(this.name);
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'] ?? null,
        age: json['age'] ?? null,
        weight: json['weight'] ?? null,
        height: json['weight'] ?? null);
  }

}