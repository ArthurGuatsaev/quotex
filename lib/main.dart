import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotex/const/color.dart';
import 'package:quotex/error/domain/bloc/error_bloc.dart';
import 'package:quotex/firebase_options.dart';
import 'package:quotex/home/home_bloc.dart';
import 'package:quotex/lessons/domain/bloc/lesson_bloc.dart';
import 'package:quotex/lessons/domain/lessons_repo.dart';
import 'package:quotex/lessons/domain/model/lesson.dart';
import 'package:quotex/loading/domain/repositories/check_repo.dart';
import 'package:quotex/loading/domain/repositories/loading_repo.dart';
import 'package:quotex/loading/domain/repositories/remote_confige.dart';
import 'package:quotex/loading/domain/repositories/services_repo.dart';
import 'package:quotex/loading/view/bloc/load_bloc.dart';
import 'package:quotex/nav_manager.dart';
import 'package:quotex/splash.dart';
import 'package:quotex/terms/domain/bloc/term_bloc.dart';
import 'package:quotex/terms/domain/model/terms_model.dart';
import 'package:quotex/terms/domain/repo/terms_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  final appDir = await getApplicationDocumentsDirectory();
  final isar =
      await Isar.open([TermsModelSchema, LessonSchema], directory: appDir.path);
  final StreamController<String> errorController = StreamController();
  final StreamController<bool> pointController = StreamController();
  final error = ErrorBloc(errorController: errorController);
  final VServices services = VServices();
  final MyCheckRepo checkRepo = MyCheckRepo(errorController: errorController);
  final LoadingRepo onbordRepo = LoadingRepo(errorController: errorController);
  final VTermsRepository termsRepository =
      VTermsRepository(isar: isar, pointController: pointController);
  final FirebaseRemote firebaseRemote =
      FirebaseRemote(errorController: errorController);
  final LessonsRepo lessonRepo =
      LessonsRepo(errorController: errorController, isar: isar);
  final lesson =
      LessonBloc(repository: lessonRepo, pointController: pointController)
        ..add(GetPointEvent());
  final navi = MyNavigatorManager.instance;
  final load = LoadBloc(
      servicesRepo: services,
      loadingRepo: onbordRepo,
      lessonRepo: lessonRepo,
      checkRepo: checkRepo,
      firebaseRemote: firebaseRemote,
      termsRepository: termsRepository)
    // ..add(FirebaseRemoteInitEvent())
    ..add(TermRepoInitEvent())
    ..add(LessonsRepoInitEvent());

  runApp(
    MyApp(
      navi: navi,
      load: load,
      lesson: lesson,
      checkRepo: checkRepo,
      firebaseRemote: firebaseRemote,
      lessonRepo: lessonRepo,
      onbordRepo: onbordRepo,
      error: error,
      termsRepository: termsRepository,
    ),
  );
}

class MyApp extends StatelessWidget {
  final MyCheckRepo checkRepo;
  final LoadingRepo onbordRepo;
  final LessonBloc lesson;
  final FirebaseRemote firebaseRemote;
  final LessonsRepo lessonRepo;
  final MyNavigatorManager navi;
  final LoadBloc load;
  final ErrorBloc error;
  final VTermsRepository termsRepository;
  const MyApp(
      {super.key,
      required this.navi,
      required this.load,
      required this.lesson,
      required this.termsRepository,
      required this.error,
      required this.checkRepo,
      required this.onbordRepo,
      required this.firebaseRemote,
      required this.lessonRepo});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => checkRepo,
        ),
        RepositoryProvider(
          create: (context) => onbordRepo,
        ),
        RepositoryProvider(
          create: (context) => firebaseRemote,
        ),
        RepositoryProvider(
          create: (context) => lessonRepo,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoadBloc>(
            create: (context) => load,
          ),
          BlocProvider<ErrorBloc>(
            create: (context) => error,
          ),
          BlocProvider<LessonBloc>(
            create: (context) => lesson..add(GetLessonsEvent()),
          ),
          BlocProvider<TermsBloc>(
            lazy: true,
            create: (context) => TermsBloc(repository: termsRepository)
              ..add(GetTermsModelEvent())
              ..add(GetTestCountEvent())
              ..add(GetHistoryFirstEvent()),
          ),
          BlocProvider<HomeBloc>(
            create: (context) =>
                HomeBloc(lessonRepo: context.read<LessonsRepo>())
                  ..add(GetTermsEvent()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navi.key,
          theme: ThemeData(
            appBarTheme:
                AppBarTheme(backgroundColor: backgroundColor, elevation: 0),
            scaffoldBackgroundColor: backgroundColor,
            iconTheme: const IconThemeData(color: Colors.white),
            textTheme: const TextTheme(
              bodySmall: TextStyle(fontSize: 10),
              bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              labelSmall: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
              displaySmall: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300),
              displayMedium: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w700),
              labelMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          onGenerateRoute: navi.onGenerateRoute,
          initialRoute: SplashPage.routeName,
        ),
      ),
    );
  }
}
