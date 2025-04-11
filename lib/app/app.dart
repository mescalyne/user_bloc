import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_i18n/loaders/file_translation_loader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:userlist_app/app/app_theme.dart';
import 'package:userlist_app/app/navigation/app_route.dart';
import 'package:userlist_app/core/services/implementations/dio_network_service.dart';
import 'package:userlist_app/features/user/data/repositories/implementations/user_repository_impl.dart';
import 'package:userlist_app/features/user/presentation/logic/user_bloc.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              UserPageBloc(UserRepositoryImpl(DioNetworkService(Dio()))),
      child: MaterialApp.router(
        supportedLocales: const <Locale>[
          Locale('en', 'US'),
          Locale('es', 'ES'),
        ],
        localizationsDelegates: <LocalizationsDelegate<dynamic>>[
          FlutterI18nDelegate(
            translationLoader: FileTranslationLoader(
              basePath: 'assets/locales',
            ),
          ),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        title: 'User List App',
        theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(),
          extensions: <ThemeExtension<dynamic>>[AutoTheme.lightTheme],
        ),
        darkTheme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(),
          extensions: <ThemeExtension<dynamic>>[AutoTheme.darkTheme],
        ),
        themeMode: ThemeMode.dark,
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
