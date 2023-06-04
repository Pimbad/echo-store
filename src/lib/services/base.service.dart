import 'package:echo_store/enums/api.enum.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BaseService {
  static const String _fakeStoreUrl = "https://fakestoreapi.com/";
  static const String _echoStoreUrl = "https://echo-store-api.azurewebsites.net/";
  
  static const Map<String, String> _defaultHeaders = <String, String> {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  @protected
  Future<http.Response> postAsync(String uri, Object body, {Api api = Api.fakestore}) async {
    return http.post(
      Uri.parse(_getUrl(api) + uri),
      headers: _defaultHeaders,
      body: body
    );
  }

  @protected
  Future<http.Response> getAsync(String uri, {Api api = Api.fakestore}) async {
    return http.get(
      Uri.parse(_getUrl(api) + uri),
      headers: _defaultHeaders
    );
  }

  @protected
  Future<http.Response> deleteAsync(String uri, {Api api = Api.fakestore}) async {
    return http.delete(
      Uri.parse(_getUrl(api) + uri)
    );
  }

  String _getUrl(Api api){
    switch(api){
      case Api.fakestore:
        return _fakeStoreUrl;

      case Api.echostore:
        return _echoStoreUrl;
    }
  }
}
