import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

import '../../../core/network/api_constance.dart';
import '../../../core/utils/enums.dart';
import '../screens/movie_detail_screen.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
        buildWhen: (previous, current) =>
            previous.nowPlayingMoviesState != current.nowPlayingMoviesState,
        builder: (context, state) {
          switch (state.nowPlayingMoviesState) {
            case RequestState.loading:
              return const SizedBox(
                height: 400,
                width: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );

            case RequestState.loaded:
              return FadeIn(
                duration: const Duration(milliseconds: 500),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 400.0,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {},
                  ),
                  items: state.nowPlayingMovies.map(
                    (item) {
                      return GestureDetector(
                        key: const Key('openMovieMinimalDetail'),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(id: item.id,),));

                          /// TODO : NAVIGATE TO MOVIE DETAILS
                        },
                        child: Stack(
                          children: [
                            ShaderMask(
                              shaderCallback: (rect) {
                                return const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    // fromLTRB
                                    Colors.transparent,
                                    Colors.black,
                                    Colors.black,
                                    Colors.transparent,
                                  ],
                                  stops: [0, 0.3, 0.5, 1],
                                ).createShader(
                                  Rect.fromLTRB(0, 0, rect.width, rect.height),
                                );
                              },
                              blendMode: BlendMode.dstIn,
                              child: CachedNetworkImage(
                                height: 560.0,
                                imageUrl: item.backDropPath!=null? ApiConstance.imageUrl(item
                                        .backDropPath!):'https://w7.pngwing.com/pngs/919/963/png-transparent-error-check-mark-red-cross-miscellaneous-angle-text.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          color: Colors.redAccent,
                                          size: 16.0,
                                        ),
                                        const SizedBox(width: 4.0),
                                        Text(
                                          'Now Playing'.toUpperCase(),
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: Text(
                                      item.title,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              );

            case RequestState.error:
              return SizedBox(
                height: 400,
                child: Center(
                  child: Text(state.nowPlayingMessage),
                ),
              );
          }
        });
  }
}
