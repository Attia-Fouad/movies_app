import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/base_usecases.dart';
import '../repository/base_movie_repository.dart';

class GetMoviesDetailsUseCase extends BaseUseCases<MovieDetail, MovieDetailParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailParameters parameters) async {
    return await baseMoviesRepository.getMoviesDetails(parameters);
  }


}

class MovieDetailParameters extends EquatableConfig {
  final int movieId;

  MovieDetailParameters({required this.movieId});

  List<Object> get props => [movieId];
}