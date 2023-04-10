
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecases/base_usecases.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCases<List<Movie>> {
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularMoviesUseCase(this.baseMoviesRepository);


  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMoviesRepository.getPopularMovies();
  }

}