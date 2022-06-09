import 'package:app/models/data/user.dart';
import 'package:app/providers/api_provider.dart';
import 'package:app/utils/exceptions.dart';



mixin AuthMixin on BaseApiProvider{
Future<User> login(String username, String password) async {
    final response = await post('my_auth:login', body: {
      'username': username,
      'password': password,
    });
    if (response.statusCode == 201) {
      final user = User.fromJson(decode(response));
      userToken = user.token;
      return user;
    } else if (response.statusCode == 400) {
      throw BadRequestException(decode(response));
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<void> logout() async {
    final response = await get('my_auth:logout');
    if (response.statusCode == 200) {
      userToken = null;
    } else {
      throw Exception('Something went wrong');
    }
  }
}