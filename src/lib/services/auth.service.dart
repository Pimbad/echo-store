import 'dart:convert';

import 'package:echo_store/repository/user.repository.dart';
import 'package:echo_store/services/base.service.dart';

class AuthService extends BaseService {
  final UserRepository _userRepository = UserRepository();


  Future<bool> loginAsync(String username, String password) async {
    var body = jsonEncode(<String, String>{
      'username': username,
      'password': password
    });

    var response = await postAsync("auth/login", body);

    if(response.statusCode == 200){
      final body = json.decode(response.body);
      _userRepository.saveUserToken(body['token']);

      return true;
    }

    return false;
  }
}
