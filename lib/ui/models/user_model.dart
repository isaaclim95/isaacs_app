class UserModel {
  String name;
  String age;
  double weight;
  double height;

  UserModel({this.name, this.age, this.weight, this.height});

  UserModel.fromJson(Map<String, dynamic> parsedJSON)
      : name = parsedJSON['name'],
        age = parsedJSON['age'],
        weight = parsedJSON['weight'],
        height = parsedJSON['height'];

}