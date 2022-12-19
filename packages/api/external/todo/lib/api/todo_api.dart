//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of external.todo.api;

class TodoApi {
  TodoApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// delete todo
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] todoId (required):
  ///
  Future<Response> deleteTodoWithHttpInfo(
    int todoId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/todo/{todo_id}'.replaceAll('{todo_id}', todoId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// delete todo
  ///
  /// Parameters:
  ///
  /// * [int] todoId (required):
  ///
  Future<void> deleteTodo(
    int todoId,
  ) async {
    final response = await deleteTodoWithHttpInfo(
      todoId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// get todo
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] todoId (required):
  ///
  Future<Response> getTodoWithHttpInfo(
    int todoId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/todo/{todo_id}'.replaceAll('{todo_id}', todoId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// get todo
  ///
  /// Parameters:
  ///
  /// * [int] todoId (required):
  ///
  Future<Todo?> getTodo(
    int todoId,
  ) async {
    final response = await getTodoWithHttpInfo(
      todoId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'Todo',
      ) as Todo;
    }
    return null;
  }

  /// get todos
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getTodosWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/todos';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// get todos
  Future<List<Todo>?> getTodos() async {
    final response = await getTodosWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Todo>')
              as List)
          .cast<Todo>()
          .toList();
    }
    return null;
  }

  /// register todo
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [TodoRegisterble] todoRegisterble (required):
  Future<Response> registerTodoWithHttpInfo(
    TodoRegisterble todoRegisterble,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/todo';

    // ignore: prefer_final_locals
    Object? postBody = todoRegisterble;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// register todo
  ///
  /// Parameters:
  ///
  /// * [TodoRegisterble] todoRegisterble (required):
  Future<Todo?> registerTodo(
    TodoRegisterble todoRegisterble,
  ) async {
    final response = await registerTodoWithHttpInfo(
      todoRegisterble,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'Todo',
      ) as Todo;
    }
    return null;
  }

  /// update todo
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] todoId (required):
  ///
  ///
  /// * [TodoUpdatable] todoUpdatable (required):
  Future<Response> updateTodoWithHttpInfo(
    int todoId,
    TodoUpdatable todoUpdatable,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/todo/{todo_id}'.replaceAll('{todo_id}', todoId.toString());

    // ignore: prefer_final_locals
    Object? postBody = todoUpdatable;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// update todo
  ///
  /// Parameters:
  ///
  /// * [int] todoId (required):
  ///
  ///
  /// * [TodoUpdatable] todoUpdatable (required):
  Future<Todo?> updateTodo(
    int todoId,
    TodoUpdatable todoUpdatable,
  ) async {
    final response = await updateTodoWithHttpInfo(
      todoId,
      todoUpdatable,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'Todo',
      ) as Todo;
    }
    return null;
  }
}
