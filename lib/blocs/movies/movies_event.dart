part of 'movies_bloc.dart';

@immutable
sealed class MoviesEvent {}
class GetMovies extends MoviesEvent{}