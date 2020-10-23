class UserModel {
  String name;
  int age;
  int weight;
  int height;

  UserModel({this.name, this.age, this.weight, this.height}) {
    print(this.name);
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    print("fromJson");
    return UserModel(
        name: json['name'] ?? null,
        age: json['age'] ?? null,
        weight: json['weight'] ?? null,
        height: json['height'] ?? null);
  }

}