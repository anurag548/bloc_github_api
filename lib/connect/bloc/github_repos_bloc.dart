import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:um_poc_bloc/connect/apis/github.dart';
import 'package:um_poc_bloc/connect/model/Repo.dart';
import 'package:um_poc_bloc/connect/model/repo_commit.dart';

part 'github_repos_event.dart';
part 'github_repos_state.dart';

class GithubReposBloc extends Bloc<GithubReposEvent, GithubReposState> {
  GithubReposBloc() : super(GithubReposInitial()) {
    on<GithubReposEvent>((event, emit) async {
      try {
        emit(FetchingPublicRepo());
        var repos = await GithubApi().getRepos();
        log(repos.toString());
        // emit(FetchedPublicRepo(repositories: repos));
      } catch (e) {}
    });
  }
}
