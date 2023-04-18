import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_recommendation_use_case.dart';

import '../../../core/error/failure.dart';
import '../entities/movie_detail.dart';
import '../entities/recommendation.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMoviesDetails(
      MovieDetailParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters);
}
