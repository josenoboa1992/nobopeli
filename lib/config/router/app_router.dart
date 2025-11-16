import 'package:go_router/go_router.dart';
import 'package:nobopeli/presentation/screen/screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
