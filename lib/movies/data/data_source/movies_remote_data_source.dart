import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/movies/data/models/recommendation_model.dart';
import 'package:movies_app/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_recommendation_use_case.dart';

import '../../../core/network/error_message_model.dart';
import '../models/movie_details_model.dart';
import '../models/movies_model.dart';

abstract class MoviesBaseRemoteDateSource {
  Future<List<MoviesModel>> getNowPlayingMovies();

  Future<List<MoviesModel>> getPopularMovies();

  Future<List<MoviesModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailParameters parameters);

  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters);
}

class MoviesRemoteDateSource extends MoviesBaseRemoteDateSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      // return ErrorMessageModel.fromJson(response.data);
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      // return ErrorMessageModel.fromJson(response.data);
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      // return ErrorMessageModel.fromJson(response.data);
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.movieDetailsPath(parameters.movieId));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters) async {
      final response =
      await Dio().get(ApiConstance.recommendationPath(parameters.id));

      if (response.statusCode == 200) {
        return List<RecommendationModel>.from((response.data['results'] as List)
            .map((e) => RecommendationModel.fromJson(e)));
      } else {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }



  }

}
