import 'package:dio/dio.dart';
import 'package:diopackage/models/NewsReponse.dart';

Future<List<User>> fetchUsers() async {
  try {
    Response response = await Dio().get("http://127.0.0.1:8000/api/districts");
    if (response.statusCode == 200) {
      var getUsersData = response.data as List;
      var listUsers = getUsersData.map((i) => User.fromJSON(i)).toList();
      return listUsers;
    } else {
      throw Exception("Failed to load users");
    }
  } catch (e) {
    print(e);
  }
}

Future<User> fetchDistrics(int id) async {
  try {
    Response response =
        await Dio().get("http://127.0.0.1:8000/api/districts/$id");
    if (response.statusCode == 200) {
      return User.fromJSON(response.data);
    } else {
      throw Exception("Failed to load users");
    }
  } catch (e) {
    print(e);
  }
}
