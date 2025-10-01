import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? EProjectManagementNewWidget()
          : ASignInUPWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? EProjectManagementNewWidget()
              : ASignInUPWidget(),
        ),
        FFRoute(
          name: ASignInUPWidget.routeName,
          path: ASignInUPWidget.routePath,
          builder: (context, params) => ASignInUPWidget(),
        ),
        FFRoute(
          name: BCreateProjectWidget.routeName,
          path: BCreateProjectWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'project': getDoc(['projects'], ProjectsRecord.fromSnapshot),
          },
          builder: (context, params) => BCreateProjectWidget(
            project: params.getParam(
              'project',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CAddTeamMembersWidget.routeName,
          path: CAddTeamMembersWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'project': getDoc(['projects'], ProjectsRecord.fromSnapshot),
          },
          builder: (context, params) => CAddTeamMembersWidget(
            project: params.getParam(
              'project',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: DPeopleManagementDashboardWidget.routeName,
          path: DPeopleManagementDashboardWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'selectedProject':
                getDoc(['projects'], ProjectsRecord.fromSnapshot),
          },
          builder: (context, params) => DPeopleManagementDashboardWidget(
            selectedProject: params.getParam(
              'selectedProject',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: FCalenderAllocationsWidget.routeName,
          path: FCalenderAllocationsWidget.routePath,
          asyncParams: {
            'selectedProject':
                getDoc(['projects'], ProjectsRecord.fromSnapshot),
          },
          builder: (context, params) => FCalenderAllocationsWidget(
            selectedProject: params.getParam(
              'selectedProject',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ASignUp12Widget.routeName,
          path: ASignUp12Widget.routePath,
          requireAuth: true,
          builder: (context, params) => ASignUp12Widget(),
        ),
        FFRoute(
          name: ASignUp22Widget.routeName,
          path: ASignUp22Widget.routePath,
          requireAuth: true,
          builder: (context, params) => ASignUp22Widget(),
        ),
        FFRoute(
          name: CEditTeamMembersWidget.routeName,
          path: CEditTeamMembersWidget.routePath,
          asyncParams: {
            'project': getDoc(['projects'], ProjectsRecord.fromSnapshot),
          },
          builder: (context, params) => CEditTeamMembersWidget(
            project: params.getParam(
              'project',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: GProfileSettingWidget.routeName,
          path: GProfileSettingWidget.routePath,
          requireAuth: true,
          builder: (context, params) => GProfileSettingWidget(),
        ),
        FFRoute(
          name: HCalenderSettingWidget.routeName,
          path: HCalenderSettingWidget.routePath,
          requireAuth: true,
          builder: (context, params) => HCalenderSettingWidget(),
        ),
        FFRoute(
          name: CAddTeamMembersCopy2Widget.routeName,
          path: CAddTeamMembersCopy2Widget.routePath,
          asyncParams: {
            'project': getDoc(['projects'], ProjectsRecord.fromSnapshot),
          },
          builder: (context, params) => CAddTeamMembersCopy2Widget(
            project: params.getParam(
              'project',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CAddTeamMembersCopyWidget.routeName,
          path: CAddTeamMembersCopyWidget.routePath,
          asyncParams: {
            'project': getDoc(['projects'], ProjectsRecord.fromSnapshot),
          },
          builder: (context, params) => CAddTeamMembersCopyWidget(
            project: params.getParam(
              'project',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: IUsersManagementWidget.routeName,
          path: IUsersManagementWidget.routePath,
          requireAuth: true,
          builder: (context, params) => IUsersManagementWidget(),
        ),
        FFRoute(
          name: HCalenderSettingCopyWidget.routeName,
          path: HCalenderSettingCopyWidget.routePath,
          requireAuth: true,
          builder: (context, params) => HCalenderSettingCopyWidget(),
        ),
        FFRoute(
          name: ReportWidget.routeName,
          path: ReportWidget.routePath,
          builder: (context, params) => ReportWidget(),
        ),
        FFRoute(
          name: KAllocationViewWidget.routeName,
          path: KAllocationViewWidget.routePath,
          requireAuth: true,
          builder: (context, params) => KAllocationViewWidget(),
        ),
        FFRoute(
          name: JGeneralCalenderSettingWidget.routeName,
          path: JGeneralCalenderSettingWidget.routePath,
          requireAuth: true,
          builder: (context, params) => JGeneralCalenderSettingWidget(),
        ),
        FFRoute(
          name: HCalenderSettingCopy2Widget.routeName,
          path: HCalenderSettingCopy2Widget.routePath,
          requireAuth: true,
          builder: (context, params) => HCalenderSettingCopy2Widget(),
        ),
        FFRoute(
          name: JGeneralCalenderSettingCopyWidget.routeName,
          path: JGeneralCalenderSettingCopyWidget.routePath,
          requireAuth: true,
          builder: (context, params) => JGeneralCalenderSettingCopyWidget(),
        ),
        FFRoute(
          name: EProjectManagementNewWidget.routeName,
          path: EProjectManagementNewWidget.routePath,
          requireAuth: true,
          builder: (context, params) => EProjectManagementNewWidget(),
        ),
        FFRoute(
          name: CardsForUsersWidget.routeName,
          path: CardsForUsersWidget.routePath,
          builder: (context, params) => CardsForUsersWidget(),
        ),
        FFRoute(
          name: ASignUp22CopyWidget.routeName,
          path: ASignUp22CopyWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ASignUp22CopyWidget(),
        ),
        FFRoute(
          name: LForgetPasswordWidget.routeName,
          path: LForgetPasswordWidget.routePath,
          builder: (context, params) => LForgetPasswordWidget(),
        ),
        FFRoute(
          name: MClientsManagmentWidget.routeName,
          path: MClientsManagmentWidget.routePath,
          requireAuth: true,
          builder: (context, params) => MClientsManagmentWidget(),
        ),
        FFRoute(
          name: NAddClientWidget.routeName,
          path: NAddClientWidget.routePath,
          requireAuth: true,
          asyncParams: {
            'client': getDoc(['clients'], ClientsRecord.fromSnapshot),
          },
          builder: (context, params) => NAddClientWidget(
            client: params.getParam(
              'client',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: KAllocationViewCopyWidget.routeName,
          path: KAllocationViewCopyWidget.routePath,
          requireAuth: true,
          builder: (context, params) => KAllocationViewCopyWidget(),
        ),
        FFRoute(
          name: K1AllocationViewRescourceViewWidget.routeName,
          path: K1AllocationViewRescourceViewWidget.routePath,
          requireAuth: true,
          builder: (context, params) => K1AllocationViewRescourceViewWidget(),
        ),
        FFRoute(
          name: K1AllocationViewRescourceViewCopyWidget.routeName,
          path: K1AllocationViewRescourceViewCopyWidget.routePath,
          requireAuth: true,
          builder: (context, params) =>
              K1AllocationViewRescourceViewCopyWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/aSignInUP';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
