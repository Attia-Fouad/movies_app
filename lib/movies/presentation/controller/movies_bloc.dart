import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/use_cases/get_now_playing_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_top_rated_use_case.dart';

import '../../domain/use_cases/get_popular_movies_use_case.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  GetPopularMoviesUseCase getPopularMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMoviesEvent);

    on<GetTopRatedMoviesEvent>(_getTopRatedMoviesEvent);

    on<GetPopularMoviesEvent>(_getPopularMoviesEvent);
  }

  FutureOr<void> _getNowPlayingMoviesEvent(GetNowPlayingMoviesEvent event,Emitter<MoviesState> emit,) async {
    final result = await getNowPlayingMoviesUseCase();

    result.fold(
        (l) => emit(
              state.copyWith(
                  nowPlayingMoviesState: RequestState.error,
                  nowPlayingMessage: l.message),
            ),
        (r) => emit(
              state.copyWith(
                  nowPlayingMoviesState: RequestState.loaded,
                  nowPlayingMovies: r),
            ));
  }

  FutureOr<void> _getTopRatedMoviesEvent(GetTopRatedMoviesEvent event,Emitter<MoviesState> emit,) async {
    final result = await getTopRatedMoviesUseCase();
    result.fold(
        (l) => emit(
              state.copyWith(
                  topRatedMoviesState: RequestState.error,
                  topRatedMessage: l.message),
            ),
        (r) => emit(
              state.copyWith(
                  topRatedMoviesState: RequestState.loaded, topRatedMovies: r),
            ));
  }

  FutureOr<void> _getPopularMoviesEvent( GetPopularMoviesEvent event,Emitter<MoviesState> emit,) async {
    final result = await getPopularMoviesUseCase();
    result.fold(
        (l) => emit(
              state.copyWith(
                  popularMoviesState: RequestState.error,
                  popularMessage: l.message),
            ),
        (r) => emit(
              state.copyWith(
                  popularMoviesState: RequestState.loaded, popularMovies: r),
            ));
  }
}
