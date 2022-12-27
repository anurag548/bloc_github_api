import 'package:um_poc_bloc/barrel.dart';
import 'package:http/http.dart' as http;

import 'package:um_poc_bloc/connect/model/Repo.dart';
import 'package:um_poc_bloc/connect/model/repo_commit.dart';

abstract class GithubApiProtocol {
  const GithubApiProtocol();
  Future<List<Repositories>> getRepos();
  Future<List<GithubRepoCommit>> getRepoComit();
  String get baseUrl;
}

class GithubApi implements GithubApiProtocol {
  const GithubApi._internal();
  static const GithubApi _instance = GithubApi._internal();
  factory GithubApi() => _instance;

  @override
  String get baseUrl => 'https://api.github.com';

  @override
  Future<List<Repositories>> getRepos() async {
    // TODO: implement getRepos
    final response = await http
        .get(Uri.parse('https://api.github.com/users/anurag548/repos'));
    if (response.statusCode == 200) {
      return repositoriesFromJson(response.body);
    } else {
      throw Exception('Failed to load api response');
    }
    // return Future.value(Repositories());
    // throw UnimplementedError();
  }

  @override
  Future<List<GithubRepoCommit>> getRepoComit() async {
    final response = await http
        .get(Uri.parse('https://api.github.com/users/anurag548/repos'));
    if (response.statusCode == 200) {
      return githubRepoCommitFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }

    // TODO: implement baseUrl
  }
}
