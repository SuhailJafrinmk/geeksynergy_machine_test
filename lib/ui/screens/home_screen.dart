import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test_geeksynergy/blocs/authentication/authentication_bloc.dart';
import 'package:machine_test_geeksynergy/blocs/movies/movies_bloc.dart';
import 'package:machine_test_geeksynergy/data/models/movie_model.dart';
import 'package:machine_test_geeksynergy/ui/screens/login_screen.dart';
import 'package:machine_test_geeksynergy/ui/widgets/info_dialogue.dart';
import 'package:machine_test_geeksynergy/ui/widgets/logout_confirmation.dart';
import 'package:machine_test_geeksynergy/ui/widgets/movie_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MoviesBloc>(context).add(GetMovies());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if(state is UserSignedOut){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              child: Text('Company info'),
              onPressed: () {
                showInfoDialog(context);
              },
            ),
            IconButton(onPressed: () {
              showSignOutDialog(context);
            }, icon: const Icon(Icons.logout)),
          ],
          title: const Text("Movies"),
        ),
        body: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            if (state is MoviesInitial || state is MoviesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MoviesFetched) {
              final List<Movie> movies = state.movies;
              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return MovieTile(movie: movie);
                },
              );
            } else if (state is MoviesFetchingError) {
              return Center(child: Text("Error: ${state.message}"));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
