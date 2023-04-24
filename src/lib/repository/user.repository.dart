import 'package:localstorage/localstorage.dart';

class UserRepository{
  final LocalStorage storage = LocalStorage('user');

  void saveUserToken(String token) =>
    storage.setItem("token", token);

  String? getUserToken() =>
    storage.getItem("token");

  void removeToken() =>
    storage.setItem("token", "");
}