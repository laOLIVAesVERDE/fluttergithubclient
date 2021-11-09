
import 'dart:convert';

import 'package:fluttergithubclient/github_repository.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static final ApiClient _instance = ApiClient._privateConstructor();
  ApiClient._privateConstructor();
  static ApiClient get instance => _instance;

  Future<List<GithubRepository>> searchRepositories(String searchWord) async {
    final uri = Uri.parse("https://api.github.com/search/repositories?q=" + searchWord + "&sort=stars&order=desc");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List<GithubRepository> list = [];
      Map<String, dynamic> decoded = json.decode(response.body);
      for (var item in decoded["items"]) {
        list.add(GithubRepository.fromJson(item));
      }
      return list;
    } else {
      throw Exception('Fail to search repository');
    }
  }
}