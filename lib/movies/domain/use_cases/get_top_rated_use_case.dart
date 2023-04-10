import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecases/base_usecases.dart';
import '../../../core/error/failure.dart';
import '../repository/base_movie_repository.dart';

class GetTopRatedMoviesUseCase extends BaseUseCases {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, dynamic>> call() async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
