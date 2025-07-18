// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:checklist_app/presentation/models/checklist_view_model.dart'
    as _i14;
import 'package:checklist_app/presentation/screens/active_checklist_view_screen/active_checklist_view_screen.dart'
    as _i1;
import 'package:checklist_app/presentation/screens/active_checklists_screen/active_checklists_screen.dart'
    as _i2;
import 'package:checklist_app/presentation/screens/archive_checklist_screen/archive_checklist_screen.dart'
    as _i3;
import 'package:checklist_app/presentation/screens/checklist_templates_screen/checklist_templates_screen.dart'
    as _i4;
import 'package:checklist_app/presentation/screens/create_new_checklist_screen/create_new_checklist_screen.dart'
    as _i5;
import 'package:checklist_app/presentation/screens/main_menu_screen/main_menu_screen.dart'
    as _i7;
import 'package:checklist_app/presentation/screens/on_boarding_screens/loading_screen.dart'
    as _i6;
import 'package:checklist_app/presentation/screens/on_boarding_screens/onboarding_first_screen.dart'
    as _i8;
import 'package:checklist_app/presentation/screens/on_boarding_screens/onboarding_second_screen.dart'
    as _i9;
import 'package:checklist_app/presentation/screens/on_boarding_screens/onboarding_tab.dart'
    as _i10;
import 'package:checklist_app/presentation/screens/settings_screen/settings_screen.dart'
    as _i11;
import 'package:flutter/material.dart' as _i13;

/// generated route for
/// [_i1.ActiveChecklistViewScreen]
class ActiveChecklistViewRoute
    extends _i12.PageRouteInfo<ActiveChecklistViewRouteArgs> {
  ActiveChecklistViewRoute({
    _i13.Key? key,
    required _i14.ChecklistViewModel checklist,
    List<_i12.PageRouteInfo>? children,
  }) : super(
         ActiveChecklistViewRoute.name,
         args: ActiveChecklistViewRouteArgs(key: key, checklist: checklist),
         initialChildren: children,
       );

  static const String name = 'ActiveChecklistViewRoute';

  static _i12.PageInfo page = _i12.PageInfo(
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

  final _i13.Key? key;

  final _i14.ChecklistViewModel checklist;

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
class ActiveChecklistsRoute extends _i12.PageRouteInfo<void> {
  const ActiveChecklistsRoute({List<_i12.PageRouteInfo>? children})
    : super(ActiveChecklistsRoute.name, initialChildren: children);

  static const String name = 'ActiveChecklistsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i2.ActiveChecklistsScreen();
    },
  );
}

/// generated route for
/// [_i3.ArchiveChecklistScreen]
class ArchiveChecklistRoute extends _i12.PageRouteInfo<void> {
  const ArchiveChecklistRoute({List<_i12.PageRouteInfo>? children})
    : super(ArchiveChecklistRoute.name, initialChildren: children);

  static const String name = 'ArchiveChecklistRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i3.ArchiveChecklistScreen();
    },
  );
}

/// generated route for
/// [_i4.ChecklistTemplatesScreen]
class ChecklistTemplatesRoute
    extends _i12.PageRouteInfo<ChecklistTemplatesRouteArgs> {
  ChecklistTemplatesRoute({
    _i13.Key? key,
    String? hintText,
    List<_i12.PageRouteInfo>? children,
  }) : super(
         ChecklistTemplatesRoute.name,
         args: ChecklistTemplatesRouteArgs(key: key, hintText: hintText),
         initialChildren: children,
       );

  static const String name = 'ChecklistTemplatesRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChecklistTemplatesRouteArgs>(
        orElse: () => const ChecklistTemplatesRouteArgs(),
      );
      return _i4.ChecklistTemplatesScreen(
        key: args.key,
        hintText: args.hintText,
      );
    },
  );
}

class ChecklistTemplatesRouteArgs {
  const ChecklistTemplatesRouteArgs({this.key, this.hintText});

  final _i13.Key? key;

  final String? hintText;

  @override
  String toString() {
    return 'ChecklistTemplatesRouteArgs{key: $key, hintText: $hintText}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChecklistTemplatesRouteArgs) return false;
    return key == other.key && hintText == other.hintText;
  }

  @override
  int get hashCode => key.hashCode ^ hintText.hashCode;
}

/// generated route for
/// [_i5.CreateNewChecklistScreen]
class CreateNewChecklistRoute
    extends _i12.PageRouteInfo<CreateNewChecklistRouteArgs> {
  CreateNewChecklistRoute({
    _i13.Key? key,
    required bool isForCustomTemplate,
    List<_i12.PageRouteInfo>? children,
  }) : super(
         CreateNewChecklistRoute.name,
         args: CreateNewChecklistRouteArgs(
           key: key,
           isForCustomTemplate: isForCustomTemplate,
         ),
         initialChildren: children,
       );

  static const String name = 'CreateNewChecklistRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateNewChecklistRouteArgs>();
      return _i5.CreateNewChecklistScreen(
        key: args.key,
        isForCustomTemplate: args.isForCustomTemplate,
      );
    },
  );
}

class CreateNewChecklistRouteArgs {
  const CreateNewChecklistRouteArgs({
    this.key,
    required this.isForCustomTemplate,
  });

  final _i13.Key? key;

  final bool isForCustomTemplate;

  @override
  String toString() {
    return 'CreateNewChecklistRouteArgs{key: $key, isForCustomTemplate: $isForCustomTemplate}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateNewChecklistRouteArgs) return false;
    return key == other.key && isForCustomTemplate == other.isForCustomTemplate;
  }

  @override
  int get hashCode => key.hashCode ^ isForCustomTemplate.hashCode;
}

/// generated route for
/// [_i6.LoadingScreen]
class LoadingRoute extends _i12.PageRouteInfo<void> {
  const LoadingRoute({List<_i12.PageRouteInfo>? children})
    : super(LoadingRoute.name, initialChildren: children);

  static const String name = 'LoadingRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoadingScreen();
    },
  );
}

/// generated route for
/// [_i7.MainMenuScreen]
class MainMenuRoute extends _i12.PageRouteInfo<void> {
  const MainMenuRoute({List<_i12.PageRouteInfo>? children})
    : super(MainMenuRoute.name, initialChildren: children);

  static const String name = 'MainMenuRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i7.MainMenuScreen();
    },
  );
}

/// generated route for
/// [_i8.OnboardingFirstScreen]
class OnboardingFirstRoute extends _i12.PageRouteInfo<void> {
  const OnboardingFirstRoute({List<_i12.PageRouteInfo>? children})
    : super(OnboardingFirstRoute.name, initialChildren: children);

  static const String name = 'OnboardingFirstRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i8.OnboardingFirstScreen();
    },
  );
}

/// generated route for
/// [_i9.OnboardingSecondScreen]
class OnboardingSecondRoute extends _i12.PageRouteInfo<void> {
  const OnboardingSecondRoute({List<_i12.PageRouteInfo>? children})
    : super(OnboardingSecondRoute.name, initialChildren: children);

  static const String name = 'OnboardingSecondRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i9.OnboardingSecondScreen();
    },
  );
}

/// generated route for
/// [_i10.OnboardingTabsScreen]
class OnboardingTabsRoute extends _i12.PageRouteInfo<void> {
  const OnboardingTabsRoute({List<_i12.PageRouteInfo>? children})
    : super(OnboardingTabsRoute.name, initialChildren: children);

  static const String name = 'OnboardingTabsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i10.OnboardingTabsScreen();
    },
  );
}

/// generated route for
/// [_i11.SettingsScreen]
class SettingsRoute extends _i12.PageRouteInfo<void> {
  const SettingsRoute({List<_i12.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i11.SettingsScreen();
    },
  );
}
