import 'package:go_router/go_router.dart';
import 'package:mini_app/core/routing/routes.dart';
import 'package:mini_app/features/home/ui/views/home_view.dart';
import 'package:mini_app/features/home/ui/views/widget_examples_tabbed.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(path: Routes.home, builder: (context, state) => const HomeView()),
      GoRoute(
        path: Routes.autocompleteExample,
        builder: (context, state) => const AutocompleteTabView(),
      ),
      GoRoute(
        path: Routes.absorbPointerExample,
        builder: (context, state) => const AbsorbPointerTabView(),
      ),
      GoRoute(
        path: Routes.dismissibleExample,
        builder: (context, state) => const DismissibleTabView(),
      ),
      GoRoute(
        path: Routes.dragTargetExample,
        builder: (context, state) => const DragTargetTabView(),
      ),
      GoRoute(
        path: Routes.draggableExample,
        builder: (context, state) => const DraggableTabView(),
      ),
      GoRoute(
        path: Routes.heroExample,
        builder: (context, state) => const HeroTabView(),
      ),
      GoRoute(
        path: Routes.baselineExample,
        builder: (context, state) => const BaselineTabView(),
      ),
      GoRoute(
        path: Routes.fractionallySizedBoxExample,
        builder: (context, state) => const FractionallySizedBoxTabView(),
      ),
      GoRoute(
        path: Routes.limitedBoxExample,
        builder: (context, state) => const LimitedBoxTabView(),
      ),
    ],
  );
}
