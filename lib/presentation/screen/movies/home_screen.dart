import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nobopeli/presentation/providers/movies/movies_providers.dart';
import 'package:nobopeli/presentation/providers/movies/movies_slide_show_provider.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final moviesSlideShow = ref.watch(moviesSlideShowProvider);
    return Column(
      children: [
        CustomAppbar(),
        MoviesSlideShow(movies: moviesSlideShow),
        MoviesSlideListView(
          movies: nowPlayingMovies,
          title: 'En Cines',
          subtitle: 'Lunes 20',
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
      ],
    );
  }
}
