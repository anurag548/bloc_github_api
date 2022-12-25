part of 'github_repos_bloc.dart';

@immutable
abstract class GithubReposState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GithubReposInitial extends GithubReposState {}

class FetchingPublicRepo extends GithubReposState {}

class FetchedPublicRepo extends GithubReposState {
  final Repositories repositories;

  FetchedPublicRepo({required this.repositories});

  @override
  // TODO: implement props
  List<Object?> get props => [repositories];
}

class FetchingRepoCommit extends GithubReposState {
  // List<Object?> get props => throw UnimplementedError();
}

class FetchedRepoCommit extends GithubReposState {
  final GithubRepoCommit githubRepoCommit;

  FetchedRepoCommit({required this.githubRepoCommit});

  @override
  // TODO: implement props
  List<Object?> get props => [githubRepoCommit];
}
