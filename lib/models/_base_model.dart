import 'package:intl/intl.dart';

export 'package:json_annotation/json_annotation.dart';

class BaseModel {
  bool selected = false;

  static double? jsonToDouble(dynamic input) {
    double? result;
    switch (input.runtimeType) {
      case String:
        result = double.tryParse(input);
        break;
      case double:
        result = input;
        break;
    }
    return result;
  }

  static String? doubleToJson(double input) {
    return input.toStringAsFixed(4);
  }
}

extension modelExtension on Map<String, dynamic> {
  Map<String, dynamic> mapper() {
    Map<String, dynamic> result = <String, dynamic>{};

    forEach((k, v) {
      bool isDateTimeValid(String input) {
        bool isValid = false;
        try {
          DateFormat('y-M-dTH:m:s.SZ').parse(v);
          isValid = true;
          // ignore: empty_catches
        } on FormatException {}
        return isValid;
      }

      result[k] = v is String ? (DateTime.tryParse(v) ?? v) : v;
      result[k] =
          v is String ? (isDateTimeValid(v) ? DateTime.tryParse(v) : v) : v;
    });
    return result;
  }
}

class PageNumberPagination {
  late int count;
  late String next;
  late String previous;
  dynamic results;

  PageNumberPagination(
      {required this.count,
      required this.next,
      required this.previous,
      this.results});

  PageNumberPagination.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    results = json['results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    data['results'] = results;
    return data;
  }
}

class Paginator {
  late int total;
  late int page;
  late int size;
  dynamic items;

  Paginator(
      {required this.total,
      required this.page,
      required this.size,
      this.items});

  Paginator.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    size = json['size'];
    items = json['items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['page'] = page;
    data['size'] = size;
    data['items'] = items;
    return data;
  }
}
