import 'package:flutter_bloc/flutter_bloc.dart';

import 'barrel.dart';
import 'connect/bloc/github_repos_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GithubReposBloc(),
      child: MaterialApp(
        themeMode: ThemeMode.system,
        darkTheme: ThemeData.dark(),
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.white10),
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Container(
          color: Colors.amber,
        ),
      ),
    );
  }
}
