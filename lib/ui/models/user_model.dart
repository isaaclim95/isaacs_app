class UserModel {
  String name;
  int age;
  double weight;
  double height;

  UserModel({this.name, this.age, this.weight, this.height});
  factory UserModel.fromJson(Map<String, dynamic> json) {

    // This was having problems, model.dataReady was null because types were not right.
    // If the collection didn't have all the constructor fields, it would just infinitely load.
    return UserModel(
        name: json['name'] ?? '',
        age: json['age'] ?? 0,
        weight: json['weight'] == null ? 0.0 : json['weight'].toDouble(),
        height: json['height'] == null ? 0.0 : json['height'].toDouble());
  }
}