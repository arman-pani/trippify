import 'dart:core';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trippify/pages/auth/login_page.dart';
import 'package:trippify/pages/auth/profile_creation_page.dart';
import 'package:trippify/pages/auth/register_page.dart';
import 'package:trippify/pages/create_trip_page.dart';
import 'package:trippify/pages/home_page.dart';
import 'package:trippify/pages/index.dart';
import 'package:trippify/pages/post/create_post_page.dart';
import 'package:trippify/pages/profile/edit_profile_page.dart';
import 'package:trippify/pages/profile/profile_page.dart';
import 'package:trippify/pages/saved_trip_page.dart';
import 'package:trippify/pages/start_page.dart';
import 'package:trippify/utils/shared_prefs_methods.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _profileNavigatorKey = GlobalKey<NavigatorState>();
final _savedTripsNavigatorKey = GlobalKey<NavigatorState>();

class AppRouterConstants {
  static const String startPage = 'start';
  static const String createProfile = 'create-profile';
  static const String homePage = 'home';
  static const String profilePage = 'profile';
  static const String savedTripPage = 'saved-trips';
  static const String signUpPage = 'sign-up';
  static const String signInPage = 'sign-in';
  static const String createTrip = 'create-trip';
  static const String tripPage = 'trip';
  static const String itineraryPage = 'itinerary';
  static const String editProfile = 'edit-profile';
  static const String createPost = 'create-post';
}

Future<GoRouter> getAppRouter() async {
  final userId = await SharedPrefsMethods.getUserId();

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: userId != null ? '/home' : '/',
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/',
        name: AppRouterConstants.startPage,
        builder: (context, state) => const StartPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/sign-up',
        name: AppRouterConstants.signUpPage,
        builder: (context, state) => RegisterPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/sign-in',
        name: AppRouterConstants.signInPage,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/create-profile',
        name: AppRouterConstants.createProfile,
        builder: (context, state) => const ProfileCreationPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/create-trip',
        name: AppRouterConstants.createTrip,
        builder: (context, state) => const CreateTripPage(),
      ),

      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: '/trip',
      //   name: AppRouterConstants.tripPage,
      //   builder: (context, state) => const TripPage(),
      // ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return IndexScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/home',
                name: AppRouterConstants.homePage,
                builder: (context, state) => const HomePage(),
                routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/create-post',
                name: AppRouterConstants.createPost,
                builder: (context, state) => CreatePostPage(),
                routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _savedTripsNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/saved-trips',
                name: AppRouterConstants.savedTripPage,
                builder: (context, state) => const SavedTripPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _profileNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                  path: '/profile',
                  name: AppRouterConstants.profilePage,
                  builder: (context, state) => const ProfilePage(),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: '/profile/edit',
                      name: AppRouterConstants.editProfile,
                      builder: (context, state) => const EditProfilePage(),
                    )
                  ]),
            ],
          ),
        ],
      )
    ],
  );
}
