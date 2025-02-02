import 'package:exam_mobile/models/todo.dart';

import 'base_provider.dart';

class TodoProvider extends BaseProvider<ToDo4924> {
  TodoProvider() : super("ToDo4924");

  @override
  ToDo4924 fromJson(data) {
    return ToDo4924.fromJson(data);
  }
}
