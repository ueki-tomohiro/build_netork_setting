//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of external.todo.api;

class TodoRegisterble {
  /// Returns a new [TodoRegisterble] instance.
  TodoRegisterble({
    required this.description,
    required this.endDate,
  });

  String description;

  DateTime endDate;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoRegisterble &&
          other.description == description &&
          other.endDate == endDate;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (description.hashCode) + (endDate.hashCode);

  @override
  String toString() =>
      'TodoRegisterble[description=$description, endDate=$endDate]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'description'] = this.description;
    json[r'end_date'] = this.endDate.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [TodoRegisterble] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TodoRegisterble? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "TodoRegisterble[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "TodoRegisterble[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TodoRegisterble(
        description: mapValueOfType<String>(json, r'description')!,
        endDate: mapDateTime(json, r'end_date', '')!,
      );
    }
    return null;
  }

  static List<TodoRegisterble>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <TodoRegisterble>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TodoRegisterble.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TodoRegisterble> mapFromJson(dynamic json) {
    final map = <String, TodoRegisterble>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TodoRegisterble.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TodoRegisterble-objects as value to a dart map
  static Map<String, List<TodoRegisterble>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<TodoRegisterble>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TodoRegisterble.listFromJson(
          entry.value,
          growable: growable,
        );
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'description',
    'end_date',
  };
}
