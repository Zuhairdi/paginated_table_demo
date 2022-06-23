import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:paginated_datatable_demo/models/model.dart';

class DataServices {
  static readJson(String dir) async {
    final String response = await rootBundle.loadString(dir);
    final result = await json.decode(response);
    return result.map<Model>((e) => Model.fromJson(e)).toList();
  }
}
