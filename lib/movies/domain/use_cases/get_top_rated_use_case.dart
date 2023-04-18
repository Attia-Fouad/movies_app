import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecases/base_usecases.dart';
import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';

class GetTopRatedMoviesUseCase extends BaseUseCases<List<Movie>,NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getTopRatedMovies();
  }


}
