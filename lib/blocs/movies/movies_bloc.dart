import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:machine_test_geeksynergy/data/models/movie_model.dart';
import 'package:machine_test_geeksynergy/data/repositories/movie_repo.dart';
import 'package:meta/meta.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitial()) {
    on<GetMovies>(getMovies);
  }

  FutureOr<void> getMovies(GetMovies event, Emitter<MoviesState> emit)async{
    final response=await MovieRepo.getMovies();
    response.fold(
      ifLeft: (failure){
        emit(MoviesFetchingError(message: failure.toString()));
      }, 
      ifRight: (success){
      final wholeData = success.data as Map<String, dynamic>;
      final requiredData = wholeData['Search'] as List<dynamic>;
      final List<Movie> movies = requiredData
          .map((item) => Movie.fromJson(item as Map<String, dynamic>))
          .toList();
      emit(MoviesFetched(movies: movies));
      });
  }
}
