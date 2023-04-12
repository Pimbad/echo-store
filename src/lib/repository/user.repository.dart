import 'package:localstorage/localstorage.dart';

class UserRepository{
  final LocalStorage storage = LocalStorage('user');

  void saveUserToken(String token) =>
    storage.setItem("token", token);

  void getUserToken() =>
    storage.getItem("token");
}