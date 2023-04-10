import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String? backDropPath;
  final List<int> genreIds;
  final String overview;
  final dynamic voteAverage;
  final dynamic releaseDate;


  const Movie(
    this.id,
    this.title,
    this.backDropPath,
    this.genreIds,
    this.overview,
    this.voteAverage,
    this.releaseDate,
  );

  @override
  List<Object?> get props => [
        backDropPath,
        id,
        title,
        genreIds,
        overview,
        voteAverage,
        releaseDate,
      ];
}
