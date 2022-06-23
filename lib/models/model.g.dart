// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Model',
      json,
      ($checkedConvert) {
        final val = Model(
          firstname: $checkedConvert('Firstname', (v) => v as String),
          lastname: $checkedConvert('Lastname', (v) => v as String),
          company: $checkedConvert('company', (v) => v as String),
          mobile: $checkedConvert('mobile', (v) => v as String),
          house: $checkedConvert('house', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String),
          birthday: $checkedConvert('birthday', (v) => v as String),
          selected: $checkedConvert(
                  'selected', (v) => v == null ? null : v as bool) ??
              false,
        );
        return val;
      },
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'Firstname': instance.firstname,
      'Lastname': instance.lastname,
      'company': instance.company,
      'mobile': instance.mobile,
      'house': instance.house,
      'email': instance.email,
      'birthday': instance.birthday,
      'selected': instance.selected,
    };
