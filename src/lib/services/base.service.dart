import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BaseService {
  static const String _baseUrl = "https://fakestoreapi.com/";
  
  static const Map<String, String> _defaultHeaders = <String, String> {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  @protected
  Future<http.Response> postAsync(String uri, Object body) async {
    return http.post(
      Uri.parse(_baseUrl + uri),
      headers: _defaultHeaders,
      body: body
    );
  }

  @protected
  Future<http.Response> getAsync(String uri) async {
    return http.get(
      Uri.parse(_baseUrl + uri),
      headers: _defaultHeaders
    );
  }
}
