import 'dart:convert';

import 'package:awesome_todo_app/services/todo_service.dart';

class TodoController {
  final TodoService _todoService = TodoService();

  getAllTodos() async {
    await _todoService.getAllTodosRequest().then((response) {
      int statusCode = response.statusCode;
      Map<String, dynamic> body = jsonDecode(response.body);
      if (statusCode == 200) {
        print('success');
      } else {
        print('error');
      }
    });
  }
}





// import 'dart:convert';

// import 'package:awesome_todo_app/models/todo.dart';
// import 'package:awesome_todo_app/services/todo_service.dart';
// import 'package:flutter/material.dart';

// class TodoController {
//   final TodoService _todoService = TodoService();

//   /// get all todo as a list of todos
//   Future<List<Todo>> getAllTodos() async {
//     List<Todo> todo = [];
//     await _todoService.getAllTodosRequest().then((response) {
//       int statusCode = response.statusCode;
//       //  Map<String, dynamic> body = jsonDecode(response.body);
//       if (statusCode == 200) {
//         //success
//         todo = todoFromJson(response.body);
//       } else {
//         //error
//         todo = [];
//       }
//     });

//     return todo;
//   }

//   ///add a new todo
//   Future<bool> createTodo(
//       {required String title,
//       required String description,
//       required DateTime deadline}) async {
//     bool isSubmitted = false;
//     await _todoService
//         .createTodo(title: title, description: description, deadline: deadline)
//         .then((response) {
//       int statusCode = response.statusCode;
//       if (statusCode == 200) {
// //success
//         isSubmitted = true;
//       } else {
//         //error
//         isSubmitted = false;
//       }
//     }).catchError((onError) {
//       isSubmitted = false;
//     });
//     return isSubmitted;
//   }

//   ///update todo completion(isCompleted = true)
//   Future<bool> updateIsCompleted({required String id}) async {
//     bool isUpdated = false;
//     await _todoService.updateStatus(id).then((response) {
//       int statusCode = response.statusCode;
//       if (statusCode == 200) {
// //success
//         isUpdated = true;
//       } else {
// //error
//         isUpdated = false;
//       }
//     }).catchError((onError) {
//       //error
//       debugPrint(onError);
//       isUpdated = false;
//     });
//     return isUpdated;
//   }

//   ///delete a todo
//   Future<bool> deleteTodo(String id) async {
//     bool isDeleted = false;
//     await _todoService.deleteTodo(id).then((response) {
//       int statusCode = response.statusCode;
//       if (statusCode == 200) {
//         //success
//         isDeleted = true;
//       } else {
//         //error
//         isDeleted = false;
//       }
//     }).catchError((onError) {
//       debugPrint(onError);
//       isDeleted = false;
//     });
//     return isDeleted;
//   }

//   ///get one todo
//   Future<Todo?> getTodo(String id) async {
//     Todo? todo;
//     await _todoService.getTodo(id).then((response) {
//       int statusCode = response.statusCode;
//       Map<String, dynamic> body = jsonDecode(response.body);
//       if (statusCode == 200) {
//         todo = Todo.fromJson(body);
//       } else {
//         todo = null;
//       }
//     });
//     return todo;
//   }
// }
