
import 'package:fluttergithubclient/github_repository.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._privateConstructor();
  ApiClient._privateConstructor();
  static ApiClient get instance => _instance;

  Future<List<GithubRepository>> _searchRepositories(String searchWord) async {
    final response = await http.get()
  }
}