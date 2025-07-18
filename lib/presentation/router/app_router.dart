import 'package:auto_route/auto_route.dart';
import 'package:checklist_app/presentation/router/app_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoadingRoute.page, initial: true),
    AutoRoute(page: OnboardingFirstRoute.page),
    AutoRoute(page: OnboardingSecondRoute.page),
    AutoRoute(page: OnboardingTabsRoute.page),
    AutoRoute(page: MainMenuRoute.page),
    AutoRoute(page: ActiveChecklistsRoute.page),
    AutoRoute(page: ArchiveChecklistRoute.page),
    AutoRoute(page: CreateNewChecklistRoute.page),
    AutoRoute(page: ActiveChecklistViewRoute.page),
    AutoRoute(page: ChecklistTemplatesRoute.page),
    AutoRoute(page: SettingsRoute.page),
  ];
}
