part of 'movies_bloc.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}
class MoviesLoading extends MoviesState{}
class MoviesFetched extends MoviesState{
  final List<Movie> movies;
  MoviesFetched({required this.movies});
}
class MoviesFetchingError extends MoviesState{
  final String message;
  MoviesFetchingError({required this.message});
}