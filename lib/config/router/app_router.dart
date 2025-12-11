import 'package:go_router/go_router.dart';
import 'package:nobopeli/presentation/screen/screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen(moviedID: id);
          },
        ),
      ],
    ),
  ],
);
