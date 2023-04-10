import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class BaseUseCases <T>{

  Future<Either<Failure,T>> call();
}