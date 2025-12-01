import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nobopeli/domain/entities/movie.dart';

class MoviesSlideListView extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;

  const MoviesSlideListView({
    super.key,
    required this.movies,
    this.title,
    this.subtitle,
    this.loadNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: Column(
        children: [
          if (title != null || subtitle != null)
            _Title(title: title, subtitle: subtitle),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return _Slide(movie: movies[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textstyle = Theme.of(context).textTheme.titleSmall;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                width: 150,
                height: 200,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  }
                  return FadeInRight(child: child);
                },
                errorBuilder: (context, error, stackTrace) {
                  return SizedBox(
                    height: 200,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.broken_image_outlined,
                            size: 50,
                            color: Colors.grey[600],
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Sin imagen',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: 150,
            child: Text(movie.title, maxLines: 2, style: textstyle),
          ),

          Row(
            children: [
              Icon(Icons.star_border, size: 15, color: Colors.amber),
              SizedBox(width: 5),
              Text('${movie.voteAverage}', style: textstyle),
              SizedBox(width: 10),
              Text(
                '(${movie.popularity})',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const _Title({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStyle),
          Spacer(),
          if (subtitle != null)
            FilledButton(
              onPressed: () {},
              style: ButtonStyle(visualDensity: VisualDensity.compact),
              child: Text(subtitle!),
            ),
        ],
      ),
    );
  }
}
