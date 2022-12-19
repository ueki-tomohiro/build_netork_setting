//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of external.todo.api;

class TodoUpdatable {
  /// Returns a new [TodoUpdatable] instance.
  TodoUpdatable({
    required this.description,
    required this.endDate,
    required this.completed,
  });

  String description;

  DateTime endDate;

  bool completed;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoUpdatable &&
          other.description == description &&
          other.endDate == endDate &&
          other.completed == completed;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (description.hashCode) + (endDate.hashCode) + (completed.hashCode);

  @override
  String toString() =>
      'TodoUpdatable[description=$description, endDate=$endDate, completed=$completed]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'description'] = this.description;
    json[r'end_date'] = this.endDate.toUtc().toIso8601String();
    json[r'completed'] = this.completed;
    return json;
  }

  /// Returns a new [TodoUpdatable] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TodoUpdatable? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "TodoUpdatable[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "TodoUpdatable[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TodoUpdatable(
        description: mapValueOfType<String>(json, r'description')!,
        endDate: mapDateTime(json, r'end_date', '')!,
        completed: mapValueOfType<bool>(json, r'completed')!,
      );
    }
    return null;
  }

  static List<TodoUpdatable>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <TodoUpdatable>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TodoUpdatable.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TodoUpdatable> mapFromJson(dynamic json) {
    final map = <String, TodoUpdatable>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TodoUpdatable.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TodoUpdatable-objects as value to a dart map
  static Map<String, List<TodoUpdatable>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<TodoUpdatable>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TodoUpdatable.listFromJson(
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
    'completed',
  };
}
