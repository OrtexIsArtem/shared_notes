import 'dart:developer';

import 'package:auth_repository/auth_repository.dart';
import 'package:firestore_repository/firestore_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_repository/notes_repository.dart';
import 'package:settings_repository/settings_repository.dart';
import 'package:shared_notes/app/app.dart';
import 'package:shared_notes/app/app_bloc_observer.dart';
import 'package:shared_notes/global_blocs/auth/auth_bloc.dart';
import 'package:shared_notes/global_blocs/setting_bloc/settings_bloc.dart';
import 'package:shared_notes/screens/notes/bloc/notes_bloc.dart';


void bootstrap() async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };


  // const kTranslationsPath = 'assets/translations';
  // const kSupportedLocales = [Locale('en'), Locale('uk')];
  // const kFallbackLocale = Locale('en');

  final AuthRepository authRepository = AuthRepository();
  final FirestoreRepository firestoreRepository = FirestoreRepository();
  final NotesRepository notesRepository = NotesRepository();
  final SettingsRepository settingsRepository = SettingsRepository();


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
        RepositoryProvider.value(
          value: notesRepository,
        ),
        RepositoryProvider.value(
          value: settingsRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: authRepository,
            ),
          ),
          BlocProvider<NotesBloc>(
            create: (context) => NotesBloc(
              notesRepository: notesRepository,
            ),
          ),
          BlocProvider<SettingsBloc>(
            create: (context) => SettingsBloc(
              settingsRepository: settingsRepository,
            ),
          ),
        ],
        child: const App(),
      ),
    ),
  );
}
