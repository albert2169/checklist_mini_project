// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:checklist_app/presentation/models/checklist_view_model.dart'
    as _i12;
import 'package:checklist_app/presentation/screens/active_checklist_view_screen/active_checklist_view_screen.dart'
    as _i1;
import 'package:checklist_app/presentation/screens/active_checklists_screen/active_checklists_screen.dart'
    as _i2;
import 'package:checklist_app/presentation/screens/archive_checklist_screen/archive_checklist_screen.dart'
    as _i3;
import 'package:checklist_app/presentation/screens/create_new_checklist_screen/create_new_checklist_screen.dart'
    as _i4;
import 'package:checklist_app/presentation/screens/main_menu_screen/main_menu_screen.dart'
    as _i6;
import 'package:checklist_app/presentation/screens/on_boarding_screens/loading_screen.dart'
    as _i5;
import 'package:checklist_app/presentation/screens/on_boarding_screens/onboarding_first_screen.dart'
    as _i7;
import 'package:checklist_app/presentation/screens/on_boarding_screens/onboarding_second_screen.dart'
    as _i8;
import 'package:checklist_app/presentation/screens/on_boarding_screens/onboarding_tab.dart'
    as _i9;
import 'package:flutter/material.dart' as _i11;

/// generated route for
/// [_i1.ActiveChecklistViewScreen]
class ActiveChecklistViewRoute
    extends _i10.PageRouteInfo<ActiveChecklistViewRouteArgs> {
  ActiveChecklistViewRoute({
    _i11.Key? key,
    required _i12.ChecklistViewModel checklist,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         ActiveChecklistViewRoute.name,
         args: ActiveChecklistViewRouteArgs(key: key, checklist: checklist),
         initialChildren: children,
       );

  static const String name = 'ActiveChecklistViewRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActiveChecklistViewRouteArgs>();
      return _i1.ActiveChecklistViewScreen(
        key: args.key,
        checklist: args.checklist,
      );
    },
  );
}

class ActiveChecklistViewRouteArgs {
  const ActiveChecklistViewRouteArgs({this.key, required this.checklist});

  final _i11.Key? key;

  final _i12.ChecklistViewModel checklist;

  @override
  String toString() {
    return 'ActiveChecklistViewRouteArgs{key: $key, checklist: $checklist}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ActiveChecklistViewRouteArgs) return false;
    return key == other.key && checklist == other.checklist;
  }

  @override
  int get hashCode => key.hashCode ^ checklist.hashCode;
}

/// generated route for
/// [_i2.ActiveChecklistsScreen]
class ActiveChecklistsRoute extends _i10.PageRouteInfo<void> {
  const ActiveChecklistsRoute({List<_i10.PageRouteInfo>? children})
    : super(ActiveChecklistsRoute.name, initialChildren: children);

  static const String name = 'ActiveChecklistsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i2.ActiveChecklistsScreen();
    },
  );
}

/// generated route for
/// [_i3.ArchiveChecklistScreen]
class ArchiveChecklistRoute extends _i10.PageRouteInfo<void> {
  const ArchiveChecklistRoute({List<_i10.PageRouteInfo>? children})
    : super(ArchiveChecklistRoute.name, initialChildren: children);

  static const String name = 'ArchiveChecklistRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.ArchiveChecklistScreen();
    },
  );
}

/// generated route for
/// [_i4.CreateNewChecklistScreen]
class CreateNewChecklistRoute extends _i10.PageRouteInfo<void> {
  const CreateNewChecklistRoute({List<_i10.PageRouteInfo>? children})
    : super(CreateNewChecklistRoute.name, initialChildren: children);

  static const String name = 'CreateNewChecklistRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i4.CreateNewChecklistScreen();
    },
  );
}

/// generated route for
/// [_i5.LoadingScreen]
class LoadingRoute extends _i10.PageRouteInfo<void> {
  const LoadingRoute({List<_i10.PageRouteInfo>? children})
    : super(LoadingRoute.name, initialChildren: children);

  static const String name = 'LoadingRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoadingScreen();
    },
  );
}

/// generated route for
/// [_i6.MainMenuScreen]
class MainMenuRoute extends _i10.PageRouteInfo<void> {
  const MainMenuRoute({List<_i10.PageRouteInfo>? children})
    : super(MainMenuRoute.name, initialChildren: children);

  static const String name = 'MainMenuRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.MainMenuScreen();
    },
  );
}

/// generated route for
/// [_i7.OnboardingFirstScreen]
class OnboardingFirstRoute extends _i10.PageRouteInfo<void> {
  const OnboardingFirstRoute({List<_i10.PageRouteInfo>? children})
    : super(OnboardingFirstRoute.name, initialChildren: children);

  static const String name = 'OnboardingFirstRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i7.OnboardingFirstScreen();
    },
  );
}

/// generated route for
/// [_i8.OnboardingSecondScreen]
class OnboardingSecondRoute extends _i10.PageRouteInfo<void> {
  const OnboardingSecondRoute({List<_i10.PageRouteInfo>? children})
    : super(OnboardingSecondRoute.name, initialChildren: children);

  static const String name = 'OnboardingSecondRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.OnboardingSecondScreen();
    },
  );
}

/// generated route for
/// [_i9.OnboardingTabsScreen]
class OnboardingTabsRoute extends _i10.PageRouteInfo<void> {
  const OnboardingTabsRoute({List<_i10.PageRouteInfo>? children})
    : super(OnboardingTabsRoute.name, initialChildren: children);

  static const String name = 'OnboardingTabsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i9.OnboardingTabsScreen();
    },
  );
}
