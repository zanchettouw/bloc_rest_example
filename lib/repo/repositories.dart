import 'dart:convert';

import 'package:bloc_rest_example/models/user_model.dart';
import 'package:http/http.dart';

class UserRepository {
  String usersUrl = 'http://reqres.in/api/users?page=2';
  String userUrl = 'https://reqres.in/api/users/2';

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(usersUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<UserModel> getuserDetails() async {
    Response response = await get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return UserModel.fromJson(result[0]);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}