import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_app/core/routing/routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget Examples'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const FlutterLogo(
              size: 100,
              style: FlutterLogoStyle.horizontal,
              textColor: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'Select a Widget Example',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  EnhancedExampleButton(
                    title: 'Autocomplete Example',
                    description: 'Text field with autocomplete suggestions',
                    route: Routes.autocompleteExample,
                    icon: Icons.search,
                  ),
                  EnhancedExampleButton(
                    title: 'AbsorbPointer Example',
                    description: 'Widget that absorbs pointer events',
                    route: Routes.absorbPointerExample,
                    icon: Icons.touch_app,
                  ),
                  EnhancedExampleButton(
                    title: 'Dismissible Example',
                    description: 'Swipe-to-dismiss list items',
                    route: Routes.dismissibleExample,
                    icon: Icons.swipe,
                  ),
                  EnhancedExampleButton(
                    title: 'DragTarget Example',
                    description: 'Drag and drop target area',
                    route: Routes.dragTargetExample,
                    icon: Icons.gps_fixed,
                  ),
                  EnhancedExampleButton(
                    title: 'Draggable Example',
                    description: 'Draggable widget with feedback',
                    route: Routes.draggableExample,
                    icon: Icons.drag_handle,
                  ),
                  EnhancedExampleButton(
                    title: 'Hero Example',
                    description: 'Hero animations between screens',
                    route: Routes.heroExample,
                    icon: Icons.flight_takeoff,
                  ),
                  EnhancedExampleButton(
                    title: 'Baseline Example',
                    description: 'Text baseline alignment',
                    route: Routes.baselineExample,
                    icon: Icons.format_align_left,
                  ),
                  EnhancedExampleButton(
                    title: 'FractionallySizedBox Example',
                    description: 'Widget sized as fraction of parent',
                    route: Routes.fractionallySizedBoxExample,
                    icon: Icons.crop_free,
                  ),
                  EnhancedExampleButton(
                    title: 'LimitedBox Example',
                    description: 'Box with size constraints',
                    route: Routes.limitedBoxExample,
                    icon: Icons.crop_square,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EnhancedExampleButton extends StatefulWidget {
  final String title;
  final String description;
  final String route;
  final IconData icon;

  const EnhancedExampleButton({
    super.key,
    required this.title,
    required this.description,
    required this.route,
    required this.icon,
  });

  @override
  State<EnhancedExampleButton> createState() => _EnhancedExampleButtonState();
}

class _EnhancedExampleButtonState extends State<EnhancedExampleButton> {
  bool _isHovered = false;
  static const Color primaryBlue = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        margin: EdgeInsets.symmetric(
          vertical: 6,
          horizontal: _isHovered ? 4 : 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _isHovered ? 0.08 : 0.04),
              blurRadius: _isHovered ? 12 : 8,
              offset: Offset(0, _isHovered ? 4 : 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => context.push(widget.route),
            borderRadius: BorderRadius.circular(16),
            splashColor: primaryBlue.withValues(alpha: 0.1),
            highlightColor: primaryBlue.withValues(alpha: 0.05),
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).cardColor,
                    Theme.of(context).cardColor.withValues(alpha: 0.95),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _isHovered
                      ? primaryBlue.withValues(alpha: 0.2)
                      : Theme.of(context).dividerColor.withValues(alpha: 0.1),
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            primaryBlue.withValues(
                              alpha: _isHovered ? 0.2 : 0.15,
                            ),
                            primaryBlue.withValues(
                              alpha: _isHovered ? 0.12 : 0.08,
                            ),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(widget.icon, color: primaryBlue, size: 28),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.title,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.3,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.description,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.color
                                      ?.withValues(alpha: 0.7),
                                  height: 1.4,
                                ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: primaryBlue.withValues(
                          alpha: _isHovered ? 0.12 : 0.08,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: AnimatedRotation(
                        duration: const Duration(milliseconds: 200),
                        turns: _isHovered ? 0 : -0.05,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: primaryBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
