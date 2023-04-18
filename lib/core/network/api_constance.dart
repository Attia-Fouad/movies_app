class ApiConstance{
  static const baseURL ='https://api.themoviedb.org/3';
  static const apiKey ='ad7fbb171091d1a56ba4b150f8cdb1e3';
  static const nowPlayingPath ='$baseURL/movie/now_playing?api_key=$apiKey';
  static const popularPath ='$baseURL/movie/popular?api_key=$apiKey';
  static const topRatedPath ='$baseURL/movie/top_rated?api_key=$apiKey';
  static  movieDetailsPath(int movieId) =>'$baseURL/movie/$movieId?api_key=$apiKey';
  static  recommendationPath(int movieId) =>'$baseURL/movie/$movieId/recommendations?api_key=$apiKey';
  static const baseImageUrl ='https://image.tmdb.org/t/p/w500';
  static  imageUrl(String path) =>'$baseImageUrl$path';

}