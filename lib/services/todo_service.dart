import 'package:http/http.dart';

class TodoService {
  final String baseUrl = 'https://angry-cap-hare.cyclic.app/';

  ///get all todos
  Future<Response> getAllTodosRequest() async {
    return await get(Uri.parse('$baseUrl/todos'));
  }

//create new todo
  Future<Response> createTodo(
      {required String title,
      required String description,
      required DateTime deadline}) async {
    Map<String, dynamic> body = {
      'title': title,
      'description': description,
      'deadline': deadline
    };
    return await post(
      Uri.parse('$baseUrl/todos'),
      body: body,
    );
  }

  Future<Response> getTodo(String id) async {
    return await get(Uri.parse('$baseUrl/todos/$id'));
  }

  Future<Response> updateTodo(String id) async {
    Map<String, dynamic> body = {
      'isCompleted': true,
    };
    return await patch(
      Uri.parse('$baseUrl/todos/$id'),
      body: body,
    );
  }

  Future<Response> updateStatus(String id) async {
    Map<String, dynamic> body = {'isCompleted': true};

    return await patch(
      Uri.parse('$baseUrl/todos/$id'),
      body: body,
    );
  }

  Future<Response> deleteTodo(String id) async {
    return await delete(Uri.parse('$baseUrl/todos/$id'));
  }
}


// import 'dart:convert';
// import 'dart:core';


// import 'package:http/http.dart';

// class TodoService {
//   final String baseUrl = 'https://insect-mindshare.cyclic-app.com';

//   ///get all todos
//   Future<Response> getAllTodosRequest() async {
//     return await get(Uri.parse('$baseUrl/todos'));
//   }

//   ///create a todo
//   Future<Response> createTodo(
//       {required String title,
//       required String description,
//       required DateTime deadline}) async {
//     Map<String, dynamic> body = {
//       'title': title,
//       'description': description,
//       'deadline': deadline.toIso8601String()
//     };
//     return await post(Uri.parse('$baseUrl/todos'), body: jsonEncode(body));
//   }

//   ///get todo by id (one todo)
//   Future<Response> getTodo(String id) async {
//     return await get(Uri.parse('$baseUrl/todos/$id'));
//   }s

//   ///update iscompleted (patch)
//   // ignore: non_constant_identifier_names
//   Future<Response> updateStatus(String id) async {
//     Map<String, dynamic> body = {'isCompleted': true};

//     return await patch(Uri.parse('$baseUrl/todos/$id'), body: body);
//   }

//   ///delete a todo
//   Future<Response> deleteTodo(String id) async {
//     return await delete(Uri.parse('$baseUrl/todos/$id'));
//   }
// }
