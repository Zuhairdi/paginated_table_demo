import '_base_model.dart';

part 'model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
  checked: true,
)
class Model {
  String firstname;
  String lastname;
  String company;
  String mobile;
  String house;
  String email;
  String birthday;
  @JsonKey(defaultValue: false)
  bool selected;

  Model({
    required this.firstname,
    required this.lastname,
    required this.company,
    required this.mobile,
    required this.house,
    required this.email,
    required this.birthday,
    //this one is new flutter, that one is old
    this.selected = false,
  });

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

  Map<String, dynamic> toJson() => _$ModelToJson(this);

  factory Model.fromMap(Map<String, dynamic> objectMap) {
    Map<String, dynamic> parsedObjectMap = {};
    objectMap.forEach((k, v) {
      parsedObjectMap[k] = v.runtimeType == DateTime ? v.toIso8601String() : v;
    });
    return Model.fromJson(parsedObjectMap);
  }
  Map<String, dynamic> toMap() => toJson().mapper();
}
