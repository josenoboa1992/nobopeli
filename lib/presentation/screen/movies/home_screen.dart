import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nobopeli/presentation/providers/movies/movies_providers.dart';
import 'package:nobopeli/presentation/providers/movies/movies_slide_show_provider.dart';
import 'package:nobopeli/presentation/providers/providers.dart';
import 'package:nobopeli/presentation/widgets/shared/custom_bottom_navegation_bar.dart';
import 'package:nobopeli/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = ' home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavegationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final inicialLoading = ref.watch(inicialLoadingProvider);
    if (inicialLoading) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final moviesSlideShow = ref.watch(moviesSlideShowProvider);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          flexibleSpace: CustomAppbar(),
          backgroundColor: const Color.fromARGB(206, 255, 255, 255),
          elevation: 0,
          toolbarHeight: 70,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            MoviesSlideShow(movies: moviesSlideShow),
            MoviesSlideListView(
              movies: nowPlayingMovies,
              title: 'En Cines',
              subtitle: 'Lunes 20',
              loadNextPage: () {
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
              },
            ),

            MoviesSlideListView(
              movies: upcomingMovies,
              title: 'Próximamente',
              subtitle: 'En este mes',
              loadNextPage: () {
                ref.read(upcomingMoviesProvider.notifier).loadNextPage();
              },
            ),

            MoviesSlideListView(
              movies: popularMovies,
              title: 'Populares',
              subtitle: 'Los más vistos',
              loadNextPage: () {
                ref.read(popularMoviesProvider.notifier).loadNextPage();
              },
            ),

            MoviesSlideListView(
              movies: topRatedMovies,
              title: 'Mejor Valoradas',
              subtitle: 'Top Rated',
              loadNextPage: () {
                ref.read(topRatedMoviesProvider.notifier).loadNextPage();
              },
            ),

            // Expanded(
            //   child: ListView.builder(
            //     itemCount: nowPlayingMovies.length,
            //     itemBuilder: (context, index) {
            //       final movies = nowPlayingMovies[index];
            //       return ListTile(title: Text(movies.title));
            //     },
            //   ),
            // ),
          ]),
        ),
      ],
    );
  }
}
