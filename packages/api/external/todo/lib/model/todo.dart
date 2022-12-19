//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of external.todo.api;

class Todo {
  /// Returns a new [Todo] instance.
  Todo({
    required this.todoId,
    required this.description,
    required this.endDate,
    required this.completed,
  });

  int todoId;

  String description;

  DateTime endDate;

  bool completed;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          other.todoId == todoId &&
          other.description == description &&
          other.endDate == endDate &&
          other.completed == completed;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (todoId.hashCode) +
      (description.hashCode) +
      (endDate.hashCode) +
      (completed.hashCode);

  @override
  String toString() =>
      'Todo[todoId=$todoId, description=$description, endDate=$endDate, completed=$completed]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'todo_id'] = this.todoId;
    json[r'description'] = this.description;
    json[r'end_date'] = this.endDate.toUtc().toIso8601String();
    json[r'completed'] = this.completed;
    return json;
  }

  /// Returns a new [Todo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Todo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Todo[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Todo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Todo(
        todoId: mapValueOfType<int>(json, r'todo_id')!,
        description: mapValueOfType<String>(json, r'description')!,
        endDate: mapDateTime(json, r'end_date', '')!,
        completed: mapValueOfType<bool>(json, r'completed')!,
      );
    }
    return null;
  }

  static List<Todo>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Todo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Todo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Todo> mapFromJson(dynamic json) {
    final map = <String, Todo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Todo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Todo-objects as value to a dart map
  static Map<String, List<Todo>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Todo>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Todo.listFromJson(
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
    'todo_id',
    'description',
    'end_date',
    'completed',
  };
}
