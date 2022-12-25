import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:um_poc_bloc/connect/model/Repo.dart';
import 'package:um_poc_bloc/connect/model/repo_commit.dart';

part 'github_repos_event.dart';
part 'github_repos_state.dart';

class GithubReposBloc extends Bloc<GithubReposEvent, GithubReposState> {
  GithubReposBloc() : super(GithubReposInitial()) {
    on<GithubReposEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
