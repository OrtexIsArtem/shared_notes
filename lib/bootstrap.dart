import 'dart:developer';

import 'package:auth_repository/auth_repository.dart';
import 'package:firestore_repository/firestore_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_notes/app/app.dart';
import 'package:shared_notes/app/app_bloc_observer.dart';
import 'package:shared_notes/global_blocs/auth/auth_bloc.dart';


void bootstrap() async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };


  // const kTranslationsPath = 'assets/translations';
  // const kSupportedLocales = [Locale('en'), Locale('uk')];
  // const kFallbackLocale = Locale('en');

  final AuthRepository authRepository = AuthRepository();
  final FirestoreRepository firestoreRepository = FirestoreRepository();


  Bloc.observer = AppBlocObserver();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: firestoreRepository,
        ),
        RepositoryProvider.value(
          value: authRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: authRepository,
            ),
          ),
        ],
        child: const App(),
      ),
    ),
  );
}
