import 'package:go_router/go_router.dart';
import 'package:mini_app/core/routing/routes.dart';
import 'package:mini_app/features/home/ui/views/home_view.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(path: Routes.home, builder: (context, state) => const HomeView()),
    ],
  );
}
