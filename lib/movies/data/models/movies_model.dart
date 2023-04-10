import 'package:movies_app/movies/domain/entities/movie.dart';

class MoviesModel extends Movie {
  const MoviesModel(
      super.id,
      super.title,
      super.backDropPath,
      super.genreIds,
      super.overview,
      super.voteAverage,
      super.releaseDate
      );

  factory MoviesModel.fromJson(Map<String,dynamic>json)=>MoviesModel(
      json['id'],
      json['title'],
      json['backdrop_path'],
      List<int>.from(json['genre_ids'].map((e) => e)),
      json['overview'],
      json['vote_average'],
      json['release_date'],
  );


}
