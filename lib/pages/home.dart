import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotex/home/home_bloc.dart';
import 'package:quotex/lessons/view/achiev_page.dart';
import 'package:quotex/lessons/view/favor_lessons.dart';
import 'package:quotex/lessons/view/lessons_page.dart';
import 'package:quotex/pages/setting.dart';
import 'package:quotex/terms/view/favorite_page.dart';
import 'package:quotex/terms/view/terms_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const HomePage());
  }

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            previous.homeIndex != current.homeIndex,
        builder: (context, state) {
          return IndexedStack(index: state.homeIndex, children: const [
            TermsPage(),
            FavoritePage(),
            AchievPage(),
            LessonsPage(),
            SettingPage(),
            FavorLessons(),
          ]);
        },
      ),
    );
  }
}
