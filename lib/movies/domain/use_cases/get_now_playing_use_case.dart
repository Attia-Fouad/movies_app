
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecases/base_usecases.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCases<List<Movie>> {
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call() async{
    return await baseMoviesRepository.getNowPlayingMovies();

  }



}