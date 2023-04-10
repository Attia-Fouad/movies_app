import 'package:equatable/equatable.dart';

import '../../../core/utils/enums.dart';
import '../../domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingMoviesState;
  final String nowPlayingMessage;


  final List<Movie> topRatedMovies;
  final RequestState topRatedMoviesState;
  final String topRatedMessage;


  final List<Movie> popularMovies;
  final RequestState popularMoviesState;
  final String popularMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMoviesState = RequestState.loading,
    this.nowPlayingMessage = '',

    this.topRatedMovies = const [],
    this.topRatedMoviesState = RequestState.loading,
    this.topRatedMessage = '',

    this.popularMovies = const [],
    this.popularMoviesState = RequestState.loading,
    this.popularMessage = '',
  });

  MoviesState copyWith({
   List<Movie>? nowPlayingMovies,
   RequestState? nowPlayingMoviesState,
   String? nowPlayingMessage,


   List<Movie>? topRatedMovies,
   RequestState? topRatedMoviesState,
   String? topRatedMessage,


   List<Movie>? popularMovies,
   RequestState? popularMoviesState,
   String? popularMessage,})
{
  return MoviesState(
    nowPlayingMessage: nowPlayingMessage?? this.nowPlayingMessage,
    nowPlayingMovies: nowPlayingMovies?? this.nowPlayingMovies,
    nowPlayingMoviesState: nowPlayingMoviesState?? this.nowPlayingMoviesState,
    popularMessage: popularMessage?? this.popularMessage  ,
    popularMovies: popularMovies?? this.popularMovies,
    popularMoviesState: popularMoviesState?? this.popularMoviesState,
    topRatedMessage: topRatedMessage?? this.topRatedMessage,
    topRatedMovies: topRatedMovies?? this.topRatedMovies,
    topRatedMoviesState: topRatedMoviesState?? this.topRatedMoviesState,
  );

}
  @override
  List<Object> get props =>
      [
        nowPlayingMovies,
        nowPlayingMoviesState,
        nowPlayingMessage,
        topRatedMovies,
        topRatedMoviesState,
        topRatedMessage,
        popularMovies,
        popularMoviesState,
        popularMessage,
      ];
}
