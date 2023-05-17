import 'package:localstorage/localstorage.dart';

class UserRepository{
  static const String STORAGE_LABEL = "user";
  static const String TOKEN_TABLE = "token";
  final LocalStorage storage = LocalStorage(STORAGE_LABEL);

  void saveUserToken(String token) =>
    storage.setItem(TOKEN_TABLE, token);

  String? getUserToken() =>
    storage.getItem(TOKEN_TABLE);

  void removeToken() =>
    storage.setItem(TOKEN_TABLE, "");
}