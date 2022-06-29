import 'package:dio/dio.dart';
import 'package:freshbucket/model/user/user.dart';

class UserService {
  final Dio _dio = Dio();
  String? apiUrl = 'https://randomuser.me/api/';

  ///Get Random Users
  Future<User> getRandomUser() async {
    Response response = await _dio.get(apiUrl!);

    final userList = User.fromJson(response.data);

    return userList;
  }
}
