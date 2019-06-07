import 'dart:async';
import 'package:aad_oauth/model/token.dart';
import "dart:convert" as Convert;

class AuthStorage {
  static AuthStorage shared = new AuthStorage();
  final String _identifier = "Token";

  Future<void> saveTokenToCache(Token token) async {
    var data = Token.toJsonMap(token);
    var json = Convert.jsonEncode(data);
  }

  Future<T> loadTokenToCache<T extends Token>() async {
    var json;
    if (json == null) return null;
    try {
      var data = Convert.jsonDecode(json);
      return _getTokenFromMap<T>(data);
    } catch (exception) {
      print(exception);
      return null;
    }
  }

  Token _getTokenFromMap<T extends Token>(Map<String, dynamic> data) =>
      Token.fromJson(data);

  Future clear() async {
    //_secureStorage.delete(key:_identifier);
  }
}
